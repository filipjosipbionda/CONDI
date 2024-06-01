import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:condi/models/exam.dart';
import 'package:condi/screens/exam_screens/questions_screen.dart';
import 'package:condi/widgets/user_results_showdown.dart'; // Import the UserResultsShowdown widget
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamCard extends StatefulWidget {
  final Exam exam;

  const ExamCard({
    Key? key,
    required this.exam,
  }) : super(key: key);

  @override
  State<ExamCard> createState() => _ExamCardState();
}

class _ExamCardState extends State<ExamCard> {
  bool userHasSolved = false;

  @override
  void initState() {
    super.initState();
    _checkUserHasSolved();
  }

  Future<void> _checkUserHasSolved() async {
    bool result = await _userHasAlreadyDoneExam();
    setState(() {
      userHasSolved = result;
    });
  }

  Future<bool> _userHasAlreadyDoneExam() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('results')
          .doc(user!.uid)
          .collection('userResults')
          .doc(widget.exam.type)
          .collection('results')
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking for exam type collection: $e");
      return false;
    }
  }

  void _showResultsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: UserResultsShowdown(
              examTitle: widget.exam
                  .title), // Pass the exam type to the UserResultsShowdown widget
        );
      },
    );
  }

  Widget _buildImage(Uint8List? imageData, String imageUrl) {
    return Image.memory(imageData!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            blurStyle: BlurStyle.solid,
            color: Colors.black.withOpacity(0.5),
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 159, 99, 255),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(),
                InkWell(
                  onTap: () {
                    _showResultsDialog();
                  },
                  child: Icon(
                    Icons.poll,
                    size: 40,
                  ),
                ),
              ],
            ),
            _buildImage(widget.exam.imageData, widget.exam.imageUrl),
            const SizedBox(height: 10),
            Text(
              widget.exam.title,
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.exam.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 255, 254, 254),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QuestionsScreen(
                      examType: widget.exam.type,
                      examTitle: widget.exam.title,
                      questions: widget.exam.questions,
                    ),
                  ),
                );
              },
              child: Text(
                'Start quiz',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 159, 99, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
