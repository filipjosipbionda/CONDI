import 'dart:ui';
import 'package:condi/models/result.dart';
import 'package:condi/widgets/user_answers_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:condi/services/result_service.dart';

class ResultsScreen extends StatelessWidget {
  final String examType;
  final Result result;
  final User? user = FirebaseAuth.instance.currentUser;

  ResultsScreen({super.key, required this.result, required this.examType});

  double calculateProgress() {
    int correctCount = _getCorrectAnswers();
    return correctCount / result.answers.length;
  }

  int _getCorrectAnswers() {
    int correctCount = 0;
    result.answers.forEach((index, answer) {
      if (answer['correctIfClauseAnswer'] == answer['userIfClauseAnswer'] &&
          answer['correctMainClauseAnswer'] == answer['userMainClauseAnswer']) {
        correctCount++;
      }
    });
    return correctCount;
  }

  Future<void> submitResults(BuildContext context, int percentage) async {
    final resultService = Provider.of<ResultService>(context, listen: false);
    await resultService.saveResult(result);
    print('Results saved locally');

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Results submitted!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pop();
    }

    await resultService.sendResultToFirebase(result, percentage);
  }

  @override
  Widget build(BuildContext context) {
    double progress = calculateProgress();
    int percentage = (progress * 100).round();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 20,
            backgroundColor: const Color.fromARGB(255, 159, 99, 255),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.send_rounded,
                  size: 30,
                ),
                onPressed: () {
                  submitResults(context, percentage);
                },
              ),
            ],
            title: Text(
              'Exam results',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "${user!.displayName}'s result",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[300],
                      color: const Color.fromARGB(255, 159, 99, 255),
                      strokeWidth: 8,
                    ),
                  ),
                  Text(
                    '$percentage%',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Correctly answered:  ",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "${_getCorrectAnswers()}",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 159, 99, 255),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Time needed:  ",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: result.getTimeInText(),
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 159, 99, 255),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 11,
                ),
                Text(
                  'Answers',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: result.answers.length,
                itemBuilder: (context, index) {
                  final answer = result.answers[index];
                  return UserAnswersTile(
                    questionText: answer?['questionText'] ?? '',
                    correctAnswers: [
                      answer?['correctIfClauseAnswer'] ?? '',
                      answer?['correctMainClauseAnswer'] ?? ''
                    ],
                    userAnswers: [
                      answer?['userIfClauseAnswer'] ?? '',
                      answer?['userMainClauseAnswer'] ?? ''
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
