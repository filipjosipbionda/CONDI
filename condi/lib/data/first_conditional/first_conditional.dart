import 'package:condi/data/first_conditional/first_conditional_negation.dart';
import 'package:condi/data/first_conditional/first_conditional_question.dart';
import 'package:condi/data/first_conditional/first_conditional_usage.dart';
import 'package:flutter/material.dart';

final List<RichText> firstConditionalExamples = [
  RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'If I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'study hard',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ', I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'will pass',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' my exam.',
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
          text: 'If I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'have time',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ", I",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: '\'ll finish',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: " that letter.",
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
          text: 'drop ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'that glass',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: ', it ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'will break.',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
          text: 'don\'t leave, ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'I\'',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'll call the police.',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
];

final firstConditional = {
  'introductionTitle':
      'First Conditional: Present Possibilities & Future Certainties',
  'formText':
      'In the if-clause, Present Simple tense is used; however, in the main clause Future Simple is used. ',
  'imageForm': Image.asset(
    'lib/images/first_conditional_form.png',
    scale: 1,
  ),
  'imageTense': Image.asset(
    'lib/images/first_conditional_tense.png',
    scale: 1,
  ),
  'beCareful': [
    '- Mind the 3rd person singular in Present Simple tense which has an –s/-es inflexion on a verb.',
    '- Mind the formation of Future Simple tense which is formed of will and base form of a verb and is identical in all persons.'
  ],
  'negationCautions': firstConditionalCautions,
  'negationExamples': firstConditionalNegationExamples,
  'negativeForm': firstConditionalNegation,
  'startingExample':
      'If I study hard, I will pass my exam. = I will pass my exam if I study hard.',
  'examples': firstConditionalExamples,
  'whQuestionForm': firstConditionalWhQuestions,
  'yesNoQuestionForm': firstConditionalYesNoQuestions,
  'usageExamples': firstConditionalUsages,
};
