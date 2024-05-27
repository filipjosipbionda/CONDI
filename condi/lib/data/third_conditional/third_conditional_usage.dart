import 'package:condi/widgets/usage_example_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final firstUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• to talk about things in the past ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'happening differently ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 159, 99, 255),
        ),
      ),
      TextSpan(
        text: 'the way they really. ',
        style: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      ),
    ],
  ),
);

const firstUsageExample = UsageExampleContainer(
  text: 'If you had been more careful, you wouldn’t have made that mistake.',
);

final secondUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• to express ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'regret ',
        style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 159, 99, 255)),
      ),
      TextSpan(
        text: 'about something in the past you wish happened differently. ',
        style: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      ),
    ],
  ),
);

const secondUsageExample = UsageExampleContainer(
  text: 'If George had gone to college, he would have had a better job.',
);

final thirdUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• to ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'criticize ',
        style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 159, 99, 255)),
      ),
      TextSpan(
        text: 'someone and point out someone’s mistakes. ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    ],
  ),
);

const thirdUsageExample = UsageExampleContainer(
  text: 'If you hadn’t been late, you might have gotten that job.',
);

final List<Widget> thirdConditionalUsageDefinitions = [
  firstUsageDefinition,
  secondUsageDefinition,
  thirdUsageDefinition,
];

final List<Widget> thirdConditionalUsageExamples = [
  firstUsageExample,
  secondUsageExample,
  thirdUsageExample,
];

final thirdConditionalUsages = {
  'usageDefinitions': thirdConditionalUsageDefinitions,
  'usageExamples': thirdConditionalUsageExamples,
};
