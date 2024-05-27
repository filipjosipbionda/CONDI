import 'dart:math';
import 'package:condi/models/exam.dart';
import 'package:condi/widgets/exam_tile.dart';
import 'package:flutter/material.dart';

class ExamShowcase extends StatefulWidget {
  final List<Exam> exams;
  ExamShowcase({super.key, required this.exams});

  @override
  State<ExamShowcase> createState() => _ExamShowcaseState();
}

class _ExamShowcaseState extends State<ExamShowcase> {
  late List<Exam> selectedExams;

  @override
  void initState() {
    super.initState();
    selectedExams = _getTwoRandomExams(widget.exams);
  }

  List<Exam> _getTwoRandomExams(List<Exam> exams) {
    Random random = Random();
    Set<int> indices = Set();

    while (indices.length < 2 && indices.length < exams.length) {
      indices.add(random.nextInt(exams.length));
    }

    return indices.map((index) => exams[index]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: selectedExams.map((exam) => ExamTile(exam: exam)).toList(),
    );
  }
}
