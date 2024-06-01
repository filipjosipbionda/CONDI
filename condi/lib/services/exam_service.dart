import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:condi/models/exam.dart';
import 'package:condi/models/question.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:collection/collection.dart'; // Add this import

class ExamService extends ChangeNotifier {
  List<Exam> _exams = [];
  final String hiveBoxName = 'examsBox';
  final CollectionReference examCollection =
      FirebaseFirestore.instance.collection('exams');

  List<Exam> get exams => _exams;

  ExamService() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _openHiveBox();
    await _initialFetchExams();
    _listenToRealtimeUpdates();
  }

  Future<void> _openHiveBox() async {
    if (!Hive.isBoxOpen(hiveBoxName)) {
      await Hive.openBox<Exam>(hiveBoxName);
    }
  }

  Future<void> _initialFetchExams() async {
    await _openHiveBox();
    var examsBox = Hive.box<Exam>(hiveBoxName);

    if (examsBox.isNotEmpty) {
      print('Fetching exams from local Hive database...');
      _exams = examsBox.values.toList();
      notifyListeners();
    } else {
      print('Fetching exams from Firebase Firestore...');
      await _fetchAndStoreExamsFromFirestore();
    }
  }

  Future<void> _fetchAndStoreExamsFromFirestore() async {
    final querySnapshot = await examCollection.get();
    List<Future<Exam?>> examFutures = querySnapshot.docs.map((doc) async {
      final data = doc.data() as Map<String, dynamic>;
      try {
        List<Question> questions =
            (data['questions'] as List).map((questionData) {
          return Question(
            text: questionData['text'],
            ifClauseCorrectAnswer: questionData['ifClauseCorrectAnswer'],
            mainClauseCorrectAnswer: questionData['mainClauseCorrectAnswer'],
            answersIfClause: List<String>.from(questionData['answersIfClause']),
            answersMainClause:
                List<String>.from(questionData['answersMainClause']),
          );
        }).toList();

        Uint8List? imageData;
        try {
          final response = await http.get(Uri.parse(data['imageUrl']));
          if (response.statusCode == 200) {
            imageData = response.bodyBytes;
          }
        } catch (e) {
          print('Failed to fetch image: $e');
        }

        return Exam(
          type: data['examType'],
          title: data['examTitle'],
          imageUrl: data['imageUrl'],
          description: data['examDescription'],
          questions: questions,
          imageData: imageData,
        );
      } catch (e) {
        print('Error parsing exam data: $e');
        return null; // Return null if there's an error
      }
    }).toList();

    _exams = (await Future.wait(examFutures))
        .where((exam) => exam != null)
        .cast<Exam>()
        .toList();

    // Store fetched data in Hive
    var examsBox = Hive.box<Exam>(hiveBoxName);
    await examsBox.clear();
    for (var exam in _exams) {
      await examsBox.add(exam);
    }

    notifyListeners();
  }

  void _listenToRealtimeUpdates() {
    examCollection.snapshots().listen((querySnapshot) async {
      print('Real-time update: Fetching exams from Firebase Firestore...');
      var examsBox = Hive.box<Exam>(hiveBoxName);

      // Provjera ako ima promjena u broju dokumenata
      if (examsBox.length != querySnapshot.docs.length) {
        await _fetchAndStoreExamsFromFirestore();
        return;
      }

      // Provjera ako su atributi ispita promijenjeni
      bool examsChanged = false;
      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final hiveExam = examsBox.values.firstWhereOrNull((exam) => exam.title == data['examTitle']);

        if (hiveExam == null) {
          examsChanged = true;
          break;
        }

        // Usporedba svakog atributa
        List<Question> questions =
            (data['questions'] as List).map((questionData) {
          return Question(
            text: questionData['text'],
            ifClauseCorrectAnswer: questionData['ifClauseCorrectAnswer'],
            mainClauseCorrectAnswer: questionData['mainClauseCorrectAnswer'],
            answersIfClause: List<String>.from(questionData['answersIfClause']),
            answersMainClause:
                List<String>.from(questionData['answersMainClause']),
          );
        }).toList();

        Uint8List? imageData;
        try {
          final response = await http.get(Uri.parse(data['imageUrl']));
          if (response.statusCode == 200) {
            imageData = response.bodyBytes;
          }
        } catch (e) {
          print('Failed to fetch image: $e');
        }

        final firestoreExam = Exam(
          type: data['examType'],
          title: data['examTitle'],
          imageUrl: data['imageUrl'],
          description: data['examDescription'],
          questions: questions,
          imageData: imageData,
        );

        if (!_areExamsEqual(hiveExam, firestoreExam)) {
          examsChanged = true;
          break;
        }
      }

      if (examsChanged) {
        await _fetchAndStoreExamsFromFirestore();
      }
    });
  }

  bool _areExamsEqual(Exam hiveExam, Exam firestoreExam) {
    if (hiveExam.type != firestoreExam.type ||
        hiveExam.title != firestoreExam.title ||
        hiveExam.imageUrl != firestoreExam.imageUrl ||
        hiveExam.description != firestoreExam.description ||
        hiveExam.questions.length != firestoreExam.questions.length) {
      return false;
    }

    for (int i = 0; i < hiveExam.questions.length; i++) {
      if (!_areQuestionsEqual(hiveExam.questions[i], firestoreExam.questions[i])) {
        return false;
      }
    }

    return true;
  }

  bool _areQuestionsEqual(Question hiveQuestion, Question firestoreQuestion) {
    return hiveQuestion.text == firestoreQuestion.text &&
           hiveQuestion.ifClauseCorrectAnswer == firestoreQuestion.ifClauseCorrectAnswer &&
           hiveQuestion.mainClauseCorrectAnswer == firestoreQuestion.mainClauseCorrectAnswer &&
           ListEquality().equals(hiveQuestion.answersIfClause, firestoreQuestion.answersIfClause) &&
           ListEquality().equals(hiveQuestion.answersMainClause, firestoreQuestion.answersMainClause);
  }

  // Method for use in authPage
  Future<void> fetchExams() async {
    await _initialFetchExams();
  }
}
