import 'dart:ui';

import 'package:condi/data/conditionals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionalQuestionFormScreen extends StatelessWidget {
  final String conditionalType;

  const ConditionalQuestionFormScreen(
      {super.key, required this.conditionalType});

  @override
  Widget build(BuildContext context) {
    var whQuestionFormTheory =
        conditionals[conditionalType]!['whQuestionForm'] as List<Widget>;

    var yesNoQuestionFormTheory =
        conditionals[conditionalType]!['yesNoQuestionForm'] as List<Widget>;

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'WH-Questions',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            for (Widget sentence in whQuestionFormTheory)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: sentence,
              ),
            const Divider(
              height: 26,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'YES/NO Questions',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            for (Widget sentence in yesNoQuestionFormTheory)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: sentence,
              )
          ],
        ),
      ],
    );
  }
}
