import 'package:condi/widgets/exam_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:condi/services/exam_service.dart';

class ExamListView extends StatelessWidget {
  const ExamListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExamService>(
      builder: (context, examService, child) {
        if (examService.exams.isEmpty) {
          return const Center(child: Text('No exams found'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: examService.exams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ExamCard(exam: examService.exams[index]),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
