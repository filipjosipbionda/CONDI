import 'package:condi/components/warning_sign.dart';
import 'package:condi/data/conditionals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionalNegationFormScreen extends StatelessWidget {
  final String conditionalType;

  const ConditionalNegationFormScreen(
      {super.key, required this.conditionalType});

  @override
  Widget build(BuildContext context) {
    Widget warningWidget;
    List<RichText> negativeFormExamples =
        conditionals[conditionalType]!['negationExamples'] as List<RichText>;

    List<RichText> negativeFormTheoryExamples =
        conditionals[conditionalType]!['negativeForm'] as List<RichText>;

    List<String>? cautions =
        conditionals[conditionalType]?['negationCautions'] as List<String>?;

    if (cautions == null || cautions.isEmpty) {
      warningWidget = const SizedBox(
        height: 2,
      );
    } else {
      warningWidget = WarningSign(messages: cautions);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'How do we form it?',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        for (Widget item in negativeFormTheoryExamples)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: item,
                ),
              ],
            ),
          ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: warningWidget,
        ),
        const Divider(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'Examples',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        for (Widget item in negativeFormExamples)
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: item,
          )
      ],
    );
  }
}
