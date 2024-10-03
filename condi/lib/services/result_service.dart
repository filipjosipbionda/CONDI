import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:condi/models/result.dart';

class ResultService extends ChangeNotifier {
  final List<Result> _results = [];
  final CollectionReference resultCollection =
      FirebaseFirestore.instance.collection('results');

  List<Result> get results => _results;

  Future<void> _openUserHiveBox(String userId, String examTitle) async {
    final String hiveBoxName = 'resultsBox_${userId}_$examTitle';
    if (!Hive.isBoxOpen(hiveBoxName)) {
      await Hive.openBox<Result>(hiveBoxName);
    }
  }

  Future<void> saveResult(Result result) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String hiveBoxName = 'resultsBox_${user.uid}_${result.examTitle}';
      await _openUserHiveBox(user.uid, result.examTitle);
      var resultsBox = Hive.box<Result>(hiveBoxName);
      await resultsBox.add(result);
      print('Result saved locally in $hiveBoxName');
    }
  }

  Future<void> sendResultToFirebase(Result result, int percentage) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('results')
            .doc(user.uid)
            .set({
          'username': user.displayName,
        }, SetOptions(merge: true));

        await FirebaseFirestore.instance
            .collection('results')
            .doc(user.uid)
            .collection('userResults')
            .doc(result.examTitle)
            .collection('results')
            .add({
          'examTitle': result.examTitle,
          'numberOfQuestions': result.answers.length,
          'correctAnswers': result.correctAnswers,
          'incorrectAnswers': result.answers.length - result.correctAnswers,
          'percentage': percentage,
          'elapsedSeconds': result.elapsedSeconds,
          'timestamp': result.timestamp,
        });

        print('Result sent to Firebase');
      } catch (e) {
        print('Failed to send result to Firebase: $e');
      }
    }
  }

  Future<List<Result>> fetchResultsForExam(
      String userId, String examTitle) async {
    final String hiveBoxName = 'resultsBox_${userId}_$examTitle';
    await _openUserHiveBox(userId, examTitle);
    var resultsBox = Hive.box<Result>(hiveBoxName);

    if (resultsBox.isEmpty) {
      // Fetch from Firebase if local storage is empty
      final querySnapshot = await resultCollection
          .doc(userId)
          .collection('userResults')
          .doc(examTitle)
          .collection('results')
          .get();

      List<Result> fetchedResults = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Result(
          answers: data['answers'] != null
              ? Map<int, Map<String, String?>>.from(data['answers'])
              : {},
          correctAnswers: data['correctAnswers'] ?? 0,
          elapsedSeconds: data['elapsedSeconds'] ?? 0,
          examTitle: data['examTitle'] ?? 'No Title',
          timestamp: (data['timestamp'] as Timestamp).toDate(),
        );
      }).toList();

      for (var result in fetchedResults) {
        resultsBox.add(result);
      }

      _results.clear();
      _results.addAll(fetchedResults);
      notifyListeners();

      return fetchedResults;
    }

    List<Result> localResults = resultsBox.values.toList();
    _results.clear();
    _results.addAll(localResults);
    notifyListeners();

    return localResults;
  }


  Future<void> fetchAllResults(String userId) async {
    final hiveBoxName = 'resultsBox_$userId';
    var resultsBox = await Hive.openBox(hiveBoxName);

    if (resultsBox.isEmpty) {
      final querySnapshot =
          await resultCollection.doc(userId).collection('userResults').get();

      for (var doc in querySnapshot.docs) {
        String examTitle = doc.id;
        await fetchResultsForExam(userId, examTitle);
      }
      notifyListeners();
    }
  }

  Future<void> syncResultsIfChanged(String userId, String examTitle) async {
    final String hiveBoxName = 'resultsBox_${userId}_$examTitle';
    await _openUserHiveBox(userId, examTitle);
    var resultsBox = Hive.box<Result>(hiveBoxName);

    final querySnapshot = await resultCollection
        .doc(userId)
        .collection('userResults')
        .doc(examTitle)
        .collection('results')
        .get();

    List<Result> fetchedResults = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Result(
        answers: data['answers'] != null
            ? Map<int, Map<String, String?>>.from(data['answers'])
            : {},
        correctAnswers: data['correctAnswers'] ?? 0,
        elapsedSeconds: data['elapsedSeconds'] ?? 0,
        examTitle: data['examTitle'] ?? 'No Title',
        timestamp: (data['timestamp'] as Timestamp).toDate(),
      );
    }).toList();

    // Usporedi rezultate u Hive-u s preuzetim rezultatima i ažuriraj ih ako je potrebno
    bool hasChanged = false;
    if (resultsBox.length != fetchedResults.length) {
      hasChanged = true;
    } else {
      for (int i = 0; i < resultsBox.length; i++) {
        if (resultsBox.getAt(i) != fetchedResults[i]) {
          hasChanged = true;
          break;
        }
      }
    }

    if (hasChanged) {
      await resultsBox.clear();
      for (var result in fetchedResults) {
        resultsBox.add(result);
      }

      _results.clear();
      _results.addAll(fetchedResults);
      notifyListeners();
    }
  }

  Future<void> syncResultsBeforeShowing(String userId, String examTitle) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      await syncResultsIfChanged(userId, examTitle);
    } else {
      await fetchResultsForExam(userId, examTitle);
    }
  }
}
