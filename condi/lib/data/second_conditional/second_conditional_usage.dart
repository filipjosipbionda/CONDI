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
        text: 'highly unlikely ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 40, 224, 3),
        ),
      ),
      TextSpan(
        text: 'to happen in either present or future: ',
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
  text: 'If i were a president, I would open more disco clubs.',
);

final secondUsageDefinition = RichText(
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
          color: const Color.fromARGB(255, 40, 224, 3),
        ),
      ),
    ],
  ),
);

const secondUsageExample = UsageExampleContainer(
  text: 'If you need a ride, I could give you.',
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
        text: 'suggestions: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 40, 224, 3),
        ),
      ),
    ],
  ),
);

const thirdUsageExample = UsageExampleContainer(
  text: 'If you wanted to go sightseeing, we could take a bus tour.',
);

final fourthUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• to give ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'advice: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 40, 224, 3),
        ),
      ),
    ],
  ),
);

const fourthUsageExample = UsageExampleContainer(
  text: ' If I were you, I wouldn\'t let my child treat me this way.',
);

final fifthUsageDefinition = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
        text: '• for an ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'imagined event: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 40, 224, 3),
        ),
      ),
    ],
  ),
);

const fifthUsageExample = UsageExampleContainer(
  text: 'If I won 100000\$, I would buy a yacht.',
);

final sixthUsageDefinition = RichText(
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
        text: 'impossible present situations: ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 40, 224, 3),
        ),
      ),
    ],
  ),
);

const sixthUsageExample = UsageExampleContainer(
  text: 'I would go to that party if I didn\'t work.',
);

final List<Widget> secondConditionalUsageDefinitions = [
  firstUsageDefinition,
  secondUsageDefinition,
  thirdUsageDefinition,
  fourthUsageDefinition,
  fifthUsageDefinition,
  sixthUsageDefinition
];

final List<Widget> secondConditionalUsageExamples = [
  firstUsageExample,
  secondUsageExample,
  thirdUsageExample,
  fourthUsageExample,
  fifthUsageExample,
  sixthUsageExample,
];

final secondConditionalUsages = {
  'usageDefinitions': secondConditionalUsageDefinitions,
  'usageExamples': secondConditionalUsageExamples,
};
