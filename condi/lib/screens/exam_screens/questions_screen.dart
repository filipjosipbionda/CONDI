import 'dart:async';
import 'dart:math';
import 'package:condi/models/question.dart';
import 'package:condi/models/result.dart';
import 'package:condi/screens/exam_screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final String examType;
  final String examTitle;
  final List<Question> questions;

  const QuestionsScreen(
      {super.key,
      required this.examTitle,
      required this.questions,
      required this.examType});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  String? firstAnswer;
  String? secondAnswer;
  Map<int, Map<String, String?>> answers = {};
  int correctAnswers = 0;
  int _start = 30;
  Timer? _timer;
  List<String> shuffledIfClauseAnswers = [];
  List<String> shuffledMainClauseAnswers = [];
  Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    shuffleQuestions();
    shuffleAnswers();
    startTimer();
    _stopwatch.start();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  void startTimer() {
    _start = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          saveEmptyAnswer();
          timer.cancel();
          if (currentQuestionIndex == widget.questions.length - 1) {
            openResultsScreen();
          } else {
            moveToNextQuestion();
          }
        }
      });
    });
  }

  void shuffleQuestions() {
    widget.questions.shuffle(Random());
  }

  void shuffleAnswers() {
    setState(() {
      shuffledIfClauseAnswers = List<String>.from(
          widget.questions[currentQuestionIndex].answersIfClause);
      shuffledMainClauseAnswers = List<String>.from(
          widget.questions[currentQuestionIndex].answersMainClause);
      shuffledIfClauseAnswers.shuffle(Random());
      shuffledMainClauseAnswers.shuffle(Random());
    });
  }

  void saveEmptyAnswer() {
    answers[currentQuestionIndex] = {
      "questionText": widget.questions[currentQuestionIndex].text,
      "correctIfClauseAnswer":
          widget.questions[currentQuestionIndex].ifClauseCorrectAnswer,
      "correctMainClauseAnswer":
          widget.questions[currentQuestionIndex].mainClauseCorrectAnswer,
      "userIfClauseAnswer": firstAnswer ?? "empty",
      "userMainClauseAnswer": secondAnswer ?? "empty"
    };
  }

  void openResultsScreen() {
    _stopwatch.stop();
    int elapsedSeconds = _stopwatch.elapsed.inSeconds;
    DateTime timestamp = DateTime.now(); // Kreiraj trenutni timestamp

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          examType: widget.examType,
          result: Result(
            timestamp: timestamp, // Dodaj timestamp ovdje
            examTitle: widget.examTitle,
            answers: answers,
            correctAnswers: correctAnswers,
            elapsedSeconds: elapsedSeconds,
          ),
        ),
      ),
    );
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        firstAnswer = null;
        secondAnswer = null;
        shuffleAnswers();
      });
      startTimer();
    } else {
      openResultsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.questions[currentQuestionIndex];
    IconData buttonIcon = Icons.arrow_right_alt_sharp;
    if (currentQuestionIndex == widget.questions.length - 1) {
      buttonIcon = Icons.check;
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 20,
            backgroundColor: const Color.fromARGB(255, 159, 99, 255),
            title: Text(widget.examTitle),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          blurStyle: BlurStyle.solid,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 159, 99, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Time left: $_start",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 3),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      strokeAlign: 3,
                      value:
                          (currentQuestionIndex + 1) / widget.questions.length,
                      backgroundColor: const Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset(
                'lib/images/question_mark.png',
                scale: 1.5,
                filterQuality: FilterQuality.low,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(-2, 2),
                        blurRadius: 3,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner,
                        color: Colors.black.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 159, 99, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    currentQuestion.text,
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 231, 230, 213),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'IF CLAUSE:',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: firstAnswer,
                hint: const Text('Select answer'),
                items: shuffledIfClauseAnswers.map((String answer) {
                  return DropdownMenuItem<String>(
                    value: answer,
                    child: Text(answer),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    firstAnswer = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                'MAIN CLAUSE:',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: secondAnswer,
                hint: const Text('Select answer'),
                items: shuffledMainClauseAnswers.map((String answer) {
                  return DropdownMenuItem<String>(
                    value: answer,
                    child: Text(answer),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    secondAnswer = newValue;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (firstAnswer == null || secondAnswer == null) {
                    ScaffoldMessenger.of(context)
                        .hideCurrentSnackBar(); // Dodano za sakrivanje trenutne obavijesti
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text('Please select both answers!'),
                      ),
                    );
                  } else {
                    // Provjeriti točnost odgovora
                    bool isCorrect = firstAnswer ==
                            currentQuestion.ifClauseCorrectAnswer &&
                        secondAnswer == currentQuestion.mainClauseCorrectAnswer;

                    answers[currentQuestionIndex] = {
                      "questionText":
                          widget.questions[currentQuestionIndex].text,
                      "correctIfClauseAnswer": widget
                          .questions[currentQuestionIndex]
                          .ifClauseCorrectAnswer,
                      "correctMainClauseAnswer": widget
                          .questions[currentQuestionIndex]
                          .mainClauseCorrectAnswer,
                      "userIfClauseAnswer": firstAnswer ?? "empty",
                      "userMainClauseAnswer": secondAnswer ?? "empty"
                    };

                    if (isCorrect) {
                      correctAnswers++;
                    }
                    if (currentQuestionIndex == widget.questions.length - 1) {
                      openResultsScreen();
                    } else {
                      moveToNextQuestion();
                    }
                  }
                },
                child: Icon(
                  buttonIcon,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
