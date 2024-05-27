import 'package:flutter/material.dart';

final List<RichText> secondConditionalNegation = [
  RichText(
    text: const TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      children: [
        TextSpan(
          text: 'Negative form in Past Simple tense is formed with ',
        ),
        TextSpan(
          text: 'DID NOT + BASE FORM',
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
          text: 'WOULD NOT + BASE FORM',
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

final List<RichText> secondConditionalNegationExamples = [
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
          text: 'didn\'t have',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za glagol
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' my smartphone, I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would feel ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za would
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'bored.',
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
          text: 'didn\'t work',
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
          text: 'would watch ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za would
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'TV all day.',
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
          text: 'won ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za would
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'the lottery, I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'wouldn\'t buy',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' a car.',
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
          text: 'would not work',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za would
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: ' if I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'had ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za would
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'more money.',
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
          text: 'I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'would sleep ',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za would
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: 'late every day if I ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'didn\'t work early.',
          style: TextStyle(
            color: Color.fromARGB(255, 159, 99, 255), // Boja za would
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  ),
];

final List<String> secondConditionalNegationCautions = [
  'Always use base form of a verb after did/didn’t',
  'WRONG: If we didn’t had a car, we wouldn’t be able to visit you.',
  'CORRECT: If we didn\'t have a car, we wouldn\'t be able to visit you.',
];
