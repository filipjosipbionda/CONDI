import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> saveUserData(User user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': user.email,
      });
      print('User data saved successfully!');
    } catch (error) {
      print('Error saving user data: $error');
    }
  }

  Future<bool> checkIfUserExists(String uid) async {
    try {
      // Provjerite postoji li korisnik s određenim UID-om u kolekciji "users"
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return snapshot.exists;
    } catch (error) {
      print("Error checking user existence: $error");
      return false;
    }
  }

  Future<bool> checkIfUserHasCompletedProfileInfo(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (snapshot['username'] == "") {
      return false;
    }
    return true;
  }

  Future<void> setUserName(String userId, String username) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).set(
          {
            'username': username,
          },
          SetOptions(
              merge:
                  true)); // Koristimo merge: true da bismo ažurirali samo polje 'username', a ostala polja ostavili netaknuta
      print('Username set successfully for user $userId');
    } catch (error) {
      print('Error setting username for user $userId: $error');
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    User user = FirebaseAuth.instance.currentUser!;

    bool userExists = await checkIfUserExists(user.uid);
    if (!userExists) {
      saveUserData(user);
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      User user = FirebaseAuth.instance.currentUser!;

      bool userExists = await checkIfUserExists(user.uid);

      if (!userExists) {
        saveUserData(user);
      }
    } catch (error) {
      print("Error signing in with Facebook: $error");

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'User with that email already exists. Try signing in with email or Gmail!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
