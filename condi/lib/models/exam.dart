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
