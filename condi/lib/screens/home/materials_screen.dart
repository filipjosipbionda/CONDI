import 'dart:math';
import 'package:condi/models/exam.dart';
import 'package:condi/screens/exam_selection_screen.dart';
import 'package:condi/widgets/conditional_card.dart';
import 'package:condi/widgets/exam_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:condi/services/exam_service.dart';
import 'package:provider/provider.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  _MaterialsScreenState createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  final List<String> conditionals = [
    'Zero Conditional',
    'First Conditional',
    'Second Conditional',
    'Third Conditional',
  ];

  void _openExamScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ExamSelectionScreen(),
    ));
  }

  // Funkcija za dobivanje dva slučajna ispita
  List<Exam> _getTwoRandomExams(List<Exam> exams) {
    Random random = Random();
    Set<int> indices = Set();

    while (indices.length < 2 && indices.length < exams.length) {
      indices.add(random.nextInt(exams.length));
    }

    return indices.map((index) => exams[index]).toList();
  }

  @override
  Widget build(BuildContext context) {
    final examService = Provider.of<ExamService>(context);

    // Dobivanje dva slučajna ispita
    List<Exam> randomExams = _getTwoRandomExams(examService.exams);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      extendBody: true,
      body: ListView(
        children: [
          const SizedBox(height: 18),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                'Conditionals',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ConditionalCard(
                conditionalType: conditionals[index],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                'Exams',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 2),
              GestureDetector(
                onTap: () {
                  _openExamScreen(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'View all',
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 159, 99, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          // Prikazivanje dva slučajna ispita
          ...randomExams
              .map((exam) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: ExamTile(exam: exam)))
              .toList(),
        ],
      ),
    );
  }
}
