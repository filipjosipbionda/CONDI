import 'dart:typed_data';

import 'package:condi/models/question.dart';
import 'package:hive/hive.dart';

part 'exam.g.dart';

@HiveType(typeId: 1)
class Exam {
  @HiveField(0)
  final String type;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final List<Question> questions;

  @HiveField(5)
  int numberOfQuestions = 0;

  @HiveField(6)
  final Uint8List? imageData;

  Exam({
    required this.type,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.questions,
    this.imageData,
  }) {
    numberOfQuestions = questions.length;
  }
}

 extension ExamComparison on Exam {
  bool isEqual(Exam other) {
    if (type != other.type) return false;
    if (title != other.title) return false;
    if (imageUrl != other.imageUrl) return false;
    if (description != other.description) return false;
    if (numberOfQuestions != other.numberOfQuestions) return false;
    
    // Uporedba imageData, ako obe nisu null
    if (imageData != null && other.imageData != null) {
      if (!_compareImageData(imageData!, other.imageData!)) return false;
    } else if (imageData != other.imageData) {
      // Ako jedna od njih nije null, nisu jednake
      return false;
    }

    // Uporedba lista pitanja
    if (questions.length != other.questions.length) return false;
    for (int i = 0; i < questions.length; i++) {
      if (!questions[i].isEqual(other.questions[i])) return false;
    }

    return true;
  }

  bool _compareImageData(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
