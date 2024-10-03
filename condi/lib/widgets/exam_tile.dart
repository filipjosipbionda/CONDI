import 'dart:typed_data';
import 'package:condi/models/exam.dart';
import 'package:condi/screens/exam_screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ExamTile extends StatefulWidget {
  final Exam exam;
  const ExamTile({Key? key, required this.exam}) : super(key: key);

  @override
  _ExamTileState createState() => _ExamTileState();
}

class _ExamTileState extends State<ExamTile> {
  Uint8List? imageData;
  bool hasNetworkImage = true;

  @override
  void initState() {
    super.initState();
    _loadImageData();
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

  void _openExam(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuestionsScreen(
          examType: widget.exam.type,
          examTitle: widget.exam.title,
          questions: widget.exam.questions,
        ),
      ),
    );
  }

  Widget _buildImage(Uint8List? imageData, String imageUrl) {
    if (imageData != null) {
      return Image.memory(imageData, width: 100, height: 100, fit: BoxFit.cover);
    } else if (hasNetworkImage && imageUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(
          Icons.image_not_supported,
          size: 100,
          color: Colors.grey,
        ),
      );
    } else {
      return const Icon(
        Icons.image_not_supported,
        size: 100,
        color: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        _openExam(context);
      },
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 159, 99, 255),
        ),
        child: Row(
          children: [
            _buildImage(imageData, widget.exam.imageUrl),
            const SizedBox(width: 10), // Razmak između slike i teksta
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.exam.title.isNotEmpty)
                    Text(
                      widget.exam.title,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        shadows: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    )
                  else
                    const Text(
                      'No Title',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  Text(
                    "Questions: ${widget.exam.numberOfQuestions}",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 233, 232, 232),
                    ),
                  ),
                  Text(
                    'Double tap to start!',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      shadows: [
                        const BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 3,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
