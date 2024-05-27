import 'package:flutter/material.dart';

final thirdConditionalNegation = [
  RichText(
    text: const TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      children: [
        TextSpan(
          text: 'Negative form in Past Perfect Simple tense is formed with ',
        ),
        TextSpan(
          text: 'HAD NOT + PAST PARTICIPLE',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' of a verb',
        ),
      ],
    ),
  ),
  RichText(
    text: const TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      children: [
        TextSpan(
          text: 'Negative form in the main clause is formed with ',
        ),
        TextSpan(
          text: 'WOULD NOT + HAVE + PAST PARTICIPLE',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
];

final List<RichText> thirdConditionalNegationExamples = [
  RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'If we ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had known',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' you were coming, we ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would not have left',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' early.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  ),
  RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'They ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would not have missed',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' the flight if they ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had set',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' an alarm.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  ),
  RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'You ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would not have had',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' a headache if you ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had drunk',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' enough water.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  ),
];

final List<String> thirdConditionalNegationCautions = [
  '- Negative particle NOT is attributed to the first verb (had or would)',
  '- WRONG: If Bill hadn\'t smashed his car, his dad would haven\'t been angry with him.',
  '- CORRECT: If Bill hadn\'t smashed his car, his dad would\'t have been angry with him.',
];
