import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'result.g.dart';

@HiveType(typeId: 3)
class Result {
  @HiveField(0)
  final Map<int, Map<String, String?>> answers;

  @HiveField(1)
  final int correctAnswers;

  @HiveField(2)
  final int elapsedSeconds;

  @HiveField(3)
  final String examTitle;

  @HiveField(4)
  final DateTime timestamp; // Changed from Timestamp to DateTime

  Result({
    required this.answers,
    required this.examTitle,
    required this.correctAnswers,
    required this.elapsedSeconds,
    required this.timestamp,
  });

  int _getElapsedMinutes() {
    return elapsedSeconds ~/ 60;
  }

  int _getElapsedSeconds() {
    return elapsedSeconds % 60;
  }

  String getTimeInText() {
    return "${_getElapsedMinutes()}:${_getElapsedSeconds()}";
  }

  // Dodana metoda za formatiranje datuma
  String getFormattedDate() {
    return DateFormat('dd-MM-yyyy').format(timestamp);
  }
}
