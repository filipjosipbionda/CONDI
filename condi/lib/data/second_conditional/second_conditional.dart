import 'package:condi/data/second_conditional/second_conditional_negation.dart';
import 'package:condi/data/second_conditional/second_conditional_question.dart';
import 'package:condi/data/second_conditional/second_conditional_usage.dart';
import 'package:flutter/material.dart';

final List<RichText> secondConditionalExamples = [
  RichText(
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'Paula ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would be',
          style: TextStyle(
            color: Color.fromARGB(
                255, 159, 99, 255), // Purple color for past simple tense
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' sad if Jan left.',
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
          text: 'If dogs ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had',
          style: TextStyle(
            color: Color.fromARGB(
                255, 159, 99, 255), // Purple color for past simple tense
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' wings, they ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would be',
          style: TextStyle(
            color: Color.fromARGB(
                255, 159, 99, 255), // Purple color for would + base form
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' able to fly.',
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

final secondConditional = {
  'introductionTitle':
      'Second Conditional: Hypothetical Scenarios & Imagined Results',
  'formText':
      'In an if-clause, Past Simple tense is used; however, in the main clause would + base form.',
  'imageForm': Image.asset(
    'lib/images/second_conditional_form.png',
    scale: 1,
  ),
  'imageTense': Image.asset(
    'lib/images/second_conditional_tense.png',
    scale: 1,
  ),
  'beCareful': ['- Always use base form of a verb after did/didn’t'],
  'negationCautions': secondConditionalNegationCautions,
  'negationExamples': secondConditionalNegationExamples,
  'negativeForm': secondConditionalNegation,
  'startingExample':
      'If I were a boy, I would understand = If I was a boy, I would understand.',
  'examples': secondConditionalExamples,
  'whQuestionForm': secondConditionalWhQuestions,
  'yesNoQuestionForm': secondConditionalYesNoQuestions,
  'usageExamples': secondConditionalUsages,
};
