import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:condi/services/result_service.dart';
import 'package:condi/models/result.dart';
import 'package:condi/widgets/user_result_tile.dart';

class UserResultsShowdown extends StatelessWidget {
  final String examTitle;

  const UserResultsShowdown({super.key, required this.examTitle});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder<List<Result>>(
        future: Provider.of<ResultService>(context, listen: false)
            .fetchResultsForExam(user!.uid, examTitle),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No results found.'));
          }

          var results = snapshot.data!;
          Provider.of<ResultService>(context, listen: false)
              .syncResultsIfChanged(user.uid, examTitle);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Results History',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    Result result = results[index];
                    return UserResultTile(
                      result: result,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      ),
    );
  }
}
