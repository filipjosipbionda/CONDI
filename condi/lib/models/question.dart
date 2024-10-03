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

extension QuestionComparison on Question {
  bool isEqual(Question other) {
    if (text != other.text) return false;
    if (ifClauseCorrectAnswer != other.ifClauseCorrectAnswer) return false;
    if (mainClauseCorrectAnswer != other.mainClauseCorrectAnswer) return false;
    if (!_compareStringLists(answersIfClause, other.answersIfClause)) return false;
    if (!_compareStringLists(answersMainClause, other.answersMainClause)) return false;
    return true;
  }

  bool _compareStringLists(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
