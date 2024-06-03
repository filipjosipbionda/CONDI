import 'dart:typed_data';

import 'package:condi/models/exam.dart';
import 'package:condi/screens/exam_screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamTile extends StatelessWidget {
  final Exam exam;
  const ExamTile({Key? key, required this.exam}) : super(key: key);

  _openExam(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuestionsScreen(
          examType: exam.type,
          examTitle: exam.title,
          questions: exam.questions,
        ),
      ),
    );
  }

  Widget _buildImage(Uint8List imageData) {
    return Image.memory(imageData);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        _openExam(context);
      },
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 159, 99, 255),
        ),
        child: Row(
          children: [
            _buildImage(exam.imageData!),
            const SizedBox(width: 10), // Razmak između slike i teksta
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      shadows: [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 3,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Questions: ${exam.numberOfQuestions}",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 233, 232, 232),
                    ),
                  ),
                  Text(
                    'Double tap to start!',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      shadows: [
                        const BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 3,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
