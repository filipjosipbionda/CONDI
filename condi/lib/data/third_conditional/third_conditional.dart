import 'package:condi/data/first_conditional/first_conditional_question.dart';
import 'package:condi/data/third_conditional/third_conditional_negation.dart';
import 'package:condi/data/third_conditional/third_conditional_question.dart';
import 'package:condi/data/third_conditional/third_conditional_usage.dart';
import 'package:flutter/material.dart';

final thirdConditional = {
  'introductionTitle': 'Third Conditional: imagine a different past.',
  'formText':
      'In an if-clause, Past Perfect Simple tense is used and in the main clause would + have + past participle is used.',
  'imageForm': Image.asset(
    'lib/images/third_conditional_form.png',
    scale: 1,
  ),
  'imageTense': Image.asset(
    'lib/images/third_conditional_tense.png',
    scale: 1,
  ),
  'beCareful': [
    '- Regardless of the person, structures in both if and the main clause remain the same e.g. If Jack had come home earlier last night, his mom would has gone to bed early.'
  ],
  'negationCautions': thirdConditionalNegationCautions,
  'negationExamples': thirdConditionalNegationExamples,
  'negativeForm': thirdConditionalNegation,
  'startingExample':
      'If i had studied, I would have passed. = I would have passed if I had studied.',
  'examples': thirdConditionalExamples,
  'whQuestionForm': thirdConditionalWhQuestions,
  'yesNoQuestionForm': firstConditionalYesNoQuestions,
  'usageExamples': thirdConditionalUsages,
};

final thirdConditionalExamples = [
  RichText(
    text: const TextSpan(
      style: TextStyle(
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: 'If I ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had known',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' you were in hospital, I ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would have visited',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' you.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  ),
  RichText(
    text: const TextSpan(
      style: TextStyle(
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: 'I ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would have bought',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' you a present if I ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had known',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' it was your birthday.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  ),
  RichText(
    text: const TextSpan(
      style: TextStyle(
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: 'If you ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had given',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' me your e-mail, I ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would have written',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' to you.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  ),
];
