import 'package:condi/widgets/example_container.dart';
import 'package:condi/widgets/form_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final whQuestionExample = ExampleContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'What ',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'would ',
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
        text: 'do',
        style: GoogleFonts.inter(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'if you  ',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'were ',
        style: GoogleFonts.inter(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'a major?',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      )
    ]),
  ),
);

final whQuestionForm = FormContainer(
  child: RichText(
    text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'WH-word ',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 159, 99, 255),
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
        text: 'WOULD ',
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
        text: 'PAST SIMPLE in an if-clause',
        style: GoogleFonts.inter(
          color: Colors.redAccent,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]),
  ),
);

final whQuestionText = RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black),
    children: <TextSpan>[
      TextSpan(
        text: 'Wh-questions in Past Simple tense are formed with: ',
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
    text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'Would ',
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
        text: 'tell ',
        style: GoogleFonts.inter(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'me if you  ',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'knew ',
        style: GoogleFonts.inter(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'the answer?',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    ]),
  ),
);

final yesNoQuestionForm = FormContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'WOULD ',
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
        text: 'PAST SIMPLE in an if clause',
        style: GoogleFonts.inter(
          color: Colors.redAccent,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]),
  ),
);

final yesNoQuestionText = RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black),
    children: <TextSpan>[
      TextSpan(
        text: 'Yes/no questions in Past Simple tense are are formed with: ',
        style: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ],
  ),
);

final List<Widget> secondConditionalWhQuestions = [
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

final List<Widget> secondConditionalYesNoQuestions = [
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
