import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAnswersTile extends StatelessWidget {
  final String questionText;
  final List<String> userAnswers;
  final List<String> correctAnswers;

  const UserAnswersTile({
    super.key,
    required this.questionText,
    required this.correctAnswers,
    required this.userAnswers,
  });

  bool _areListsEqual(List<String> list1, List<String> list2) {
    if (list1.length != list2.length) {
      return false;
    }
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }
    return true;
  }

  TextSpan _buildAnswerTextSpan(String answer, bool isCorrect) {
    return TextSpan(
      text: answer,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color:
            isCorrect ? const Color.fromARGB(255, 122, 245, 126) : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isCorrect = _areListsEqual(userAnswers, correctAnswers);

    Widget icon = isCorrect
        ? const Icon(
            Icons.check,
            color: Colors.green,
            size: 30,
          )
        : const Icon(
            Icons.close,
            color: Colors.red,
            size: 30,
          );

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 159, 99, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: icon,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your answers: ',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        _buildAnswerTextSpan(userAnswers[0],
                            userAnswers[0] == correctAnswers[0]),
                        const TextSpan(
                          text: ', ',
                          style: TextStyle(color: Colors.white),
                        ),
                        _buildAnswerTextSpan(userAnswers[1],
                            userAnswers[1] == correctAnswers[1]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Correct answers: ",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "${correctAnswers[0]}, ${correctAnswers[1]}",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 122, 245, 126),
                          ),
                        ),
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
