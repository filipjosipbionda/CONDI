import 'package:flutter/material.dart';

final List<RichText> firstConditionalNegation = [
  RichText(
    text: const TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      children: [
        TextSpan(
          text: 'Negative form in Present Simple tense is formed with ',
        ),
        TextSpan(
          text: 'DO NOT/DOES NOT + INFINITIVE',
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
      ),
      children: [
        TextSpan(
          text: 'Negative form in Future Simple tense is formed with ',
        ),
        TextSpan(
          text: 'WILL NOT + BASE FORM',
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
];

final List<RichText> firstConditionalNegationExamples = [
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
          text: 'doesn\'t rain',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ', we ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'won\'t stay ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'at home.',
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
          text: 'If he ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'doesn\'t call ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'me, I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'won\'t go',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' out tonight.',
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
          text: 'I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'won\'t go ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: 'to the beach if it ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'rains.',
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
          text: 'I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'won\'t need ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'the car if my friend ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'comes ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'to pick me up. ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    ),
  ),
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
          text: 'aren’t cold',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
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
          text: 'will turn ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'the furnace down.',
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

final firstConditionalCautions = [
  '- Remember, if you are using be in the if clause, you don’t need the helping verb do.',
  '- Example: If John isn’t sick, he will go to work.'
];
