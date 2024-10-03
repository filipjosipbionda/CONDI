import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:condi/models/exam.dart';
import 'package:condi/screens/exam_screens/questions_screen.dart';
import 'package:condi/services/result_service.dart';
import 'package:condi/widgets/user_results_showdown.dart'; // Import the UserResultsShowdown widget
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

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
  Uint8List? imageData;
  bool hasNetworkImage = true;

  @override
  void initState() {
    super.initState();
    _checkUserHasSolved();
    _loadImageData();
  }

  Future<void> _checkUserHasSolved() async {
    bool result = await _userHasAlreadyDoneExam();
    if (mounted) {
      setState(() {
        userHasSolved = result;
      });
    }
  }

  Future<void> _loadImageData() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        imageData = widget.exam.imageData;
        hasNetworkImage = false;
      });
    }
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

  void _showResultsDialog() async {
    User? user = FirebaseAuth.instance.currentUser;
    await Provider.of<ResultService>(context, listen: false)
        .syncResultsBeforeShowing(user!.uid, widget.exam.title);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: UserResultsShowdown(examTitle: widget.exam.title),
        );
      },
    );
  }

  Widget _buildImage(Uint8List? imageData, String imageUrl) {
    if (imageData != null && !hasNetworkImage) {
      return Image.memory(imageData, width: 200, height: 200, fit: BoxFit.cover);
    } else if (imageUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(
          Icons.image_not_supported,
          size: 200,
          color: Colors.grey,
        ),
      );
    } else {
      return const Icon(
        Icons.image_not_supported,
        size: 200,
        color: Colors.grey,
      );
    }
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
                const Spacer(),
                InkWell(
                  onTap: () {
                    _showResultsDialog();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8), // Padding inside the circle
                    child: const Icon(
                      Icons.poll,
                      size: 40,
                      color: Color.fromARGB(255, 159, 99, 255), // Icon color
                    ),
                  ),
                ),
              ],
            ),
            _buildImage(imageData, widget.exam.imageUrl),
            const SizedBox(height: 10),
            Text(
              widget.exam.title.isNotEmpty ? widget.exam.title : 'No Title',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.exam.description.isNotEmpty
                  ? widget.exam.description
                  : 'No Description',
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
