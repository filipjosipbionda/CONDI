import 'package:hive/hive.dart';

part 'question.g.dart';

@HiveType(typeId: 2)
class Question {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final String ifClauseCorrectAnswer;

  @HiveField(2)
  final String mainClauseCorrectAnswer;

  @HiveField(3)
  final List<String> answersIfClause;

  @HiveField(4)
  final List<String> answersMainClause;

  Question({
    required this.text,
    required this.ifClauseCorrectAnswer,
    required this.mainClauseCorrectAnswer,
    required this.answersIfClause,
    required this.answersMainClause,
  });
}
