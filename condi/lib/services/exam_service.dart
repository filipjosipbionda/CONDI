import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:condi/models/exam.dart';
import 'package:condi/models/question.dart';

class ExamService extends ChangeNotifier {
  late Box<Exam> _examBox;
  List<Exam> exams = [];
  final CollectionReference examCollection =
      FirebaseFirestore.instance.collection('exams');

  ExamService() {
    initializeExams(); 
  }

  Future<void> initializeExams() async {
    await _openBox();
    await _loadExams();
    await _checkForUpdates();
  }

  Future<void> _openBox() async {
    _examBox = await Hive.openBox<Exam>('firebase-exams');
  }

  Future<void> _loadExams() async {
    exams = _examBox.values.where((exam) => exam.title.isNotEmpty).toList();
    notifyListeners();
  }

 Future<void> _checkForUpdates() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return; 
  }

  try {
    final examsSnapshot = await FirebaseFirestore.instance.collection('exams').get();

    final Map<String, Exam> firestoreExamsMap = {};

    for (var doc in examsSnapshot.docs) {
      final data = doc.data();

      final questionsData = data['questions'] as List<dynamic>;
      final questions = questionsData.map((questionData) {
        questionData = questionData as Map<String, dynamic>;
        return Question(
          text: questionData['text'] ?? '',
          ifClauseCorrectAnswer: questionData['ifClauseCorrectAnswer'] ?? '',
          mainClauseCorrectAnswer: questionData['mainClauseCorrectAnswer'] ?? '',
          answersIfClause: List<String>.from(questionData['answersIfClause'] ?? []),
          answersMainClause: List<String>.from(questionData['answersMainClause'] ?? []),
        );
      }).toList();

      final exam = Exam(
        type: data['examType'] ?? '',
        title: data['examTitle'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
        description: data['examDescription'] ?? '',
        questions: questions,
      );

      firestoreExamsMap[exam.title] = exam;

      if (!_examBox.containsKey(exam.title)) {
        _examBox.put(exam.title, exam);
      } else {
        final localExam = _examBox.get(exam.title);
        if (localExam != null && !localExam.isEqual(exam)) {
          _examBox.put(exam.title, exam);
        }
      }
    }

    for (var key in _examBox.keys) {
      if (!firestoreExamsMap.containsKey(key)) {
        _examBox.delete(key);
      }
    }

    await _loadExams(); 

    if (_examBox.length != examsSnapshot.size) {
      print('Mismatch between local and remote exam count');
    }

  } catch (e) {
    print('Error checking for exam type collection: $e');
  }
}


  
}
