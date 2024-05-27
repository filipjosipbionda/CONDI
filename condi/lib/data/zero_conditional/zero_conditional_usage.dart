import 'package:condi/widgets/usage_example_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final firstUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• when speaking about things which are always ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'true/facts:',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    ],
  ),
);

const firstUsageExample = UsageExampleContainer(
  text: 'If you heat ice, it melts',
);
final secondUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• when one thing ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'automatically results ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
      TextSpan(
        text: 'in another: ',
        style: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      ),
    ],
  ),
);

const secondUsageExample = UsageExampleContainer(
  text: 'If you don\t pay the bill, you get a warning letter.',
);

final List<Widget> zeroConditionalUsageDefinitions = [
  firstUsageDefinition,
  secondUsageDefinition,
];

final List<Widget> zeroConditionalUsageExamples = [
  firstUsageExample,
  secondUsageExample,
];

final zeroConditionalUsages = {
  'usageDefinitions': zeroConditionalUsageDefinitions,
  'usageExamples': zeroConditionalUsageExamples,
};
