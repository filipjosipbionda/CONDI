import 'package:flutter/material.dart';
import 'package:condi/models/result.dart';

class UserResultTile extends StatelessWidget {
  final Result result;
  const UserResultTile({super.key, required this.result});

  bool _isExamPassed() {
    // Pretpostavimo da je ispit položen ako je više od 50% odgovora točno
    // Možete prilagoditi ovu logiku prema vašim specifičnim zahtjevima
    int totalQuestions = result.answers.length;
    double passingPercentage = 0.5; // Prag za prolaz

    return result.correctAnswers / totalQuestions >= passingPercentage;
  }

  @override
  Widget build(BuildContext context) {
    bool isPassed = _isExamPassed();
    Color borderColor = isPassed ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 159, 99, 255),
        border: Border.all(color: borderColor, width: 5), // Dodan rub
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exam: ${result.examTitle}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Correct Answers: ${result.correctAnswers}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Time Taken: ${result.getTimeInText()}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Date Completed: ${result.getFormattedDate()}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
