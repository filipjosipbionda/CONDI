import 'package:condi/data/zero_conditional/zero_conditional_negation.dart';
import 'package:condi/data/zero_conditional/zero_conditional_question.dart';
import 'package:condi/data/zero_conditional/zero_conditional_usage.dart';
import 'package:flutter/material.dart';

final List<RichText> zeroConditionalExamples = [
  RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'If it ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'rains',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ', the ground ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'gets',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' wet.',
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
          text: 'If you ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'heat',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' ice, it ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'melts',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '.',
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
          text: 'If it ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'snows',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ', the ground ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'gets',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' covered.',
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
          text: 'If you ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'heat',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' ice, it ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'melts',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '.',
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

final zeroConditional = {
  'introductionTitle': 'Zero Conditional: Cause and effect',
  'formText':
      'In both an if-clause and the main clause, Present Simple tense is used.',
  'imageForm': Image.asset(
    'lib/images/zero_conditional_form.png',
    scale: 1.75,
  ),
  'imageTense': Image.asset(
    'lib/images/zero_conditional_tense.png',
    scale: 1.75,
  ),
  'beCareful': [
    '- Mind the 3rd person singular which has an -s/-es inflexion on a verb'
  ],
  'negativeForm': zeroConditionalNegation,
  'negationExample': 'lib/images/zero_conditional_negation.png',
  'negationCautions': zeroConditionalNegationCautions,
  'negationExamples': zeroConditionalNegationExamples,
  'startingExample':
      'If you push the button, it lights up = It lights up if you push the button.',
  'examples': zeroConditionalExamples,
  'whQuestionForm': zeroConditionalWhQuestions,
  'yesNoQuestionForm': zeroConditionalYesNoQuestions,
  'usageExamples': zeroConditionalUsages,
};
