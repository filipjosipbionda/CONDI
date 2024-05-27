import 'package:condi/models/question.dart';

List<Question> dummyZeroConditionalQuestions = [
  Question(
    text: "If I ______ (wake up) late, I ______ (be) late for work.",
    answersIfClause: [
      "wake up",
      "waked up",
      "had waked up",
      "woken up",
    ],
    answersMainClause: [
      'am',
      'will be',
      'had been',
      'was',
    ],
    ifClauseCorrectAnswer: "wake up",
    mainClauseCorrectAnswer: "am",
  ),
  Question(
    text: "If my husband ______ (cook), he ______ (burn) the food.",
    answersIfClause: [
      "cooks",
      "will cook",
      "had been cooked",
      "cooked",
    ],
    answersMainClause: [
      "burns",
      "burned",
      "will burn",
      "have burned",
    ],
    ifClauseCorrectAnswer: "cooks",
    mainClauseCorrectAnswer: "burns",
  ),
  Question(
    text: "If Julie ______ (not wear) a hat, she ______ (get) sunstroke.",
    answersIfClause: [
      "doesn't wear",
      "don't wear",
      "didn't wear",
      "hasn't wear",
    ],
    answersMainClause: [
      "gets",
      "get",
      "will get",
      "gotten",
    ],
    ifClauseCorrectAnswer: "doesn't wear",
    mainClauseCorrectAnswer: "gets",
  ),
  Question(
    text: "If children ______ (not eat) well, they ______ (not be) healthy.",
    answersIfClause: [
      "doesn't eat",
      "don't eat",
      "hadn't eaten",
      "didn't eat",
    ],
    answersMainClause: [
      "aren't",
      "weren't",
      "won't be",
      "had't been",
    ],
    ifClauseCorrectAnswer: "don't eat",
    mainClauseCorrectAnswer: "aren't",
  ),
];
