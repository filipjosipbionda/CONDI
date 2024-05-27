import 'package:condi/widgets/example_container.dart';
import 'package:condi/widgets/form_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final whQuestionExample = ExampleContainer(
  child: RichText(
    overflow: TextOverflow.clip,
    textAlign: TextAlign.center,
    text: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'Where ',
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
        text: 'have gone ',
        style: GoogleFonts.inter(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'if he ',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'had left ',
        style: GoogleFonts.inter(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'you in the middle of nowhere?',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
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
        text: 'Wh-questions are formed with: ',
        style: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ],
  ),
);

final whQuestionForm = FormContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(children: <TextSpan>[
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
        text: 'PAST PARTICIPLE',
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
        text: 'PAST PERFECT in an if-clause',
        style: GoogleFonts.inter(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      )
    ]),
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
        text: 'Peter ',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'have moved ',
        style: GoogleFonts.inter(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'if he ',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'had gotten ',
        style: GoogleFonts.inter(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      TextSpan(
        text: 'a job?',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    ]),
  ),
);

final yesNoQuestionText = RichText(
  text: TextSpan(children: <TextSpan>[
    TextSpan(
      text: 'Yes/no questions are formed with: ',
      style: GoogleFonts.inter(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ]),
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
        text: 'HAVE ',
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
        text: 'PAST PARTICIPLE ',
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
        text: 'PAST PERFECT SIMPLE in an if-clause',
        style: GoogleFonts.inter(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]),
  ),
);

final List<Widget> thirdConditionalWhQuestions = [
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

final List<Widget> thirdConditionalYesNoQuestions = [
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
