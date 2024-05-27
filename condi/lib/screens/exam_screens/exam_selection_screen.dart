import 'package:condi/widgets/exam_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamSelectionScreen extends StatefulWidget {
  const ExamSelectionScreen({super.key});

  @override
  State<ExamSelectionScreen> createState() => _ExamSelectionScreenState();
}

class _ExamSelectionScreenState extends State<ExamSelectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 99, 255),
        title: Text(
          'Exams',
          style: GoogleFonts.inter(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Choose conditional type that you want to practice',
              style: GoogleFonts.inter(
                fontSize: 15.0,
                color: const Color.fromARGB(255, 223, 219, 219),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: const Column(children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
          ],
        ),
        ExamListView(),
      ]),
    );
  }
}
