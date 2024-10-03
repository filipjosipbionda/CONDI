import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  Future<bool> checkIfUserExistsByEmail(String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      return snapshot.docs.isNotEmpty;
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

  Future<GoogleSignInAccount?> getGoogleUser() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print('Error getting Google user: $error');
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    User user = userCredential.user!;

    bool userExists = await checkIfUserExistsByEmail(user.email!);
    if (!userExists) {
      saveUserData(user);
    }
    return user;
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;
      saveUserData(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      print('User signed out!');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
