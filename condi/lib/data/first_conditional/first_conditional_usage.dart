import 'package:condi/widgets/usage_example_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final firstUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• when talking about situations which are ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'possible  ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 253, 4, 137),
        ),
      ),
      TextSpan(
        text: 'to happen: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    ],
  ),
);

const firstUsageExample = UsageExampleContainer(
  text: 'If it is a nice day, we\'ll have a picnic.',
);

final secondUsageDefinition = RichText(
  textAlign: TextAlign.start,
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• for ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'offers: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 253, 4, 137),
        ),
      ),
    ],
  ),
);

const secondUsageExample = UsageExampleContainer(
  text: 'If you need a lift, I\'ll give you one.',
);

final thirdUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• for ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'suggestions:  ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 253, 4, 137),
        ),
      ),
    ],
  ),
);

const thirdUsageExample = UsageExampleContainer(
  text: 'If you want, we can go sightseeing',
);

final fourthUsageDefinition = RichText(
  textAlign: TextAlign.start,
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• for ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'warnings: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 253, 4, 137),
        ),
      ),
    ],
  ),
);

const fourthUsageExample = UsageExampleContainer(
  text: 'If you go on like this, you\'ll get mad.',
);

final fifthUsageDefiniton = RichText(
  textAlign: TextAlign.start,
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• for ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'threats: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 253, 4, 137),
        ),
      ),
    ],
  ),
);

const fifthUsageExample = UsageExampleContainer(
  text: 'If you don\'t call calm down, I\'ll call your mom.',
);

final sixthUsageDefinition = RichText(
  textAlign: TextAlign.start,
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• for ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'superstitions: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 253, 4, 137),
        ),
      ),
    ],
  ),
);

const sixthUsageExample = UsageExampleContainer(
  text: 'If you break a mirror, you\'ll have 7 years of bad luck.',
);

final List<Widget> firstConditionalUsageDefinitions = [
  firstUsageDefinition,
  secondUsageDefinition,
  thirdUsageDefinition,
  fourthUsageDefinition,
  fifthUsageDefiniton,
  sixthUsageDefinition,
];

final List<Widget> firstConditionalUsageExamples = [
  firstUsageExample,
  secondUsageExample,
  thirdUsageExample,
  fourthUsageExample,
  fifthUsageExample,
  sixthUsageExample,
];

final firstConditionalUsages = {
  'usageDefinitions': firstConditionalUsageDefinitions,
  'usageExamples': firstConditionalUsageExamples,
};
