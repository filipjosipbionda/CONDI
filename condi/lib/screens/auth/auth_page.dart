import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:condi/screens/home/home_screen.dart';
import 'package:condi/screens/auth/login_screen.dart';
import 'package:condi/screens/auth/username_input_screen.dart';
import 'package:condi/services/exam_service.dart';
import 'package:condi/services/result_service.dart'; // Import ResultService
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    _checkUserAndFetchData(); // Call the unified method to check user and fetch data
  }

  Future<void> _checkUserAndFetchData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await Provider.of<ExamService>(context, listen: false).fetchExams();
      await Provider.of<ResultService>(context, listen: false)
          .fetchAllResults(user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(snapshot.data!.uid)
                  .snapshots(),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final userData =
                    userSnapshot.data?.data() as Map<String, dynamic>?;
                final usernameExists =
                    userData != null && userData['username'] != null;
                if (usernameExists) {
                  return const HomeScreen();
                } else {
                  return UsernameInputScreen();
                }
              },
            );
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
