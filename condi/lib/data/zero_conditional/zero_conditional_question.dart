import 'package:condi/widgets/example_container.dart';
import 'package:condi/widgets/form_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final whQuestionFirstExample = ExampleContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(
      style: const TextStyle(color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: 'What ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'do ',
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
          text: 'have to do ',
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
          text: 'lose ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'your credit card number?',
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

final whQuestionSecondExample = ExampleContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'What ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'happens ',
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
          text: 'heat ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'water to 100°C?',
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

final whQuestionFirstForm = FormContainer(
  child: RichText(
    text: const TextSpan(
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      children: [
        TextSpan(
          text: 'WH-word ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 159, 99, 255),
          ),
        ),
        TextSpan(
          text: '+ ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: 'DO/DOES ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 159, 99, 255),
          ),
        ),
        TextSpan(
          text: '+ ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: 'subject ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 159, 99, 255),
          ),
        ),
        TextSpan(
          text: '+ ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: 'BASE FORM ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 159, 99, 255),
          ),
        ),
      ],
    ),
  ),
);

final whQuestionSecondForm = FormContainer(
  child: RichText(
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'WH-word + ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'Present Simple form of a verb ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '(-e/-es in 3rd p Sg) + ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'BASE FORM:',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);

final List<Widget> zeroConditionalWhQuestions = [
  RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: 'They can be formed in ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'TWO WAYS:',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  ),
  const SizedBox(
    height: 16,
  ),
  RichText(
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'Wh-questions in ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'Present Simple tense ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'are formed with: ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
  const SizedBox(
    height: 16,
  ),
  whQuestionFirstForm,
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
  whQuestionFirstExample,
  const SizedBox(
    height: 8,
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'OR',
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  ),
  const SizedBox(
    height: 8,
  ),
  whQuestionSecondForm,
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
  whQuestionSecondExample,
];

final yesNoQuestionForm = FormContainer(
  child: RichText(
    textAlign: TextAlign.center,
    overflow: TextOverflow.clip,
    text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'DO/DOES ',
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
            text: 'BASE FORM:',
            style: GoogleFonts.inter(
              color: const Color.fromARGB(255, 159, 99, 255),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
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
          text: 'Does ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'water ',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'boil ',
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
          text: 'heat ',
          style: GoogleFonts.inter(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: 'it to 100°C?',
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

final List<Widget> zeroConditionalYesNoQuestions = [
  RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      children: <TextSpan>[
        TextSpan(
          text: 'Yes/no questions in ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextSpan(
          text: 'Present Simple tense ',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 159, 99, 255),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'are formed with: ',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
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
  ),
];
