import 'package:condi/widgets/example_container.dart';
import 'package:condi/widgets/form_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final whQuestionExample = ExampleContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(
      style: const TextStyle(color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: 'Where ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'will ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'you ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'go ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'if you ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'lose ',
          style: GoogleFonts.inter(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'your house?',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        )
      ],
    ),
  ),
);

final whQuestionText = RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black),
    children: <TextSpan>[
      TextSpan(
        text: 'Wh-questions in Future Simple tense are formed with: ',
        style: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ],
  ),
);

final yesNoQuestionExample = ExampleContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(
      style: const TextStyle(color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: 'Will ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'you ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'be ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'mad if Helen ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'arrives ',
          style: GoogleFonts.inter(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'late?',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ],
    ),
  ),
);

final yesNoQuestionText = RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black),
    children: <TextSpan>[
      TextSpan(
        text: 'Yes/no questions in Future Simple tense are formed with: ',
        style: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ],
  ),
);

final List<Widget> firstConditionalWhQuestions = [
  whQuestionText,
  const SizedBox(
    height: 16,
  ),
  whQuestionForm,
  const SizedBox(
    height: 16,
  ),
  Row(
    children: [
      const SizedBox(
        width: 20,
      ),
      Text(
        'Example:',
        style: GoogleFonts.inter(
          fontSize: 14,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  ),
  const SizedBox(
    height: 8,
  ),
  whQuestionExample,
];

final List<Widget> firstConditionalYesNoQuestions = [
  yesNoQuestionText,
  const SizedBox(
    height: 16,
  ),
  yesNoQuestionForm,
  const SizedBox(
    height: 16,
  ),
  Row(
    children: [
      const SizedBox(
        width: 20,
      ),
      Text(
        'Example:',
        style: GoogleFonts.inter(
          fontSize: 14,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  ),
  const SizedBox(
    height: 8,
  ),
  yesNoQuestionExample,
  const SizedBox(
    height: 50,
  )
];

final yesNoQuestionForm = FormContainer(
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'WILL ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '+ ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'subject ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '+ ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'BASE FORM ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '+ ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'PRESENT SIMPLE in an if clause',
          style: GoogleFonts.inter(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);

final whQuestionForm = FormContainer(
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'WH-word ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '+ ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'WILL ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '+ ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'subject ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '+ ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'BASE FORM',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '+ ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'PRESENT SIMPLE in an if-clause',
          style: GoogleFonts.inter(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  ),
);
