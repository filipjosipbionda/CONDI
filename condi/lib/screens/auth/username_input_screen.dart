import 'package:condi/components/login_text_field.dart';
import 'package:condi/screens/home/home_screen.dart';
import 'package:condi/services/auth_services.dart';
import 'package:condi/widgets/animated_login_text_field_container.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameInputScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser!;

  UsernameInputScreen({super.key});

  Future<void> setDisplayName(String displayName) async {
    try {
      if (user != null) {
        await user!.updateDisplayName(displayName);

        print('Users display name has been succesfuly set to $displayName');
      } else {
        print('User is not signed in!');
      }
    } catch (error) {
      print('$error');
    }

    await AuthService().setUserName(user!.uid, usernameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Please enter your ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16, // Postavite željenu veličinu fonta
                    ),
                  ),
                  TextSpan(
                    text: 'username',
                    style: TextStyle(
                      color: Colors.purple, // Postavite boju na ljubičastu
                      fontWeight: FontWeight.bold, // Postavite debljinu na bold
                      fontSize: 16, // Postavite željenu veličinu fonta
                    ),
                  ),
                  TextSpan(
                    text: ' below',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16, // Postavite željenu veličinu fonta
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            AnimatedLoginTextFieldContainer(
              height: 50,
              width: 300,
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 159, 99, 255),
              direction: true,
              child: LoginTextField(
                  hintText: 'username',
                  controller: usernameController,
                  obscureText: false),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () async {
                await setDisplayName(usernameController.text);
                Navigator.of(context).pushReplacement(_openHomeScreen());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: GoogleFonts.inter()),
              child: Icon(
                Icons.arrow_right_alt_sharp,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _openHomeScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;

        const curve = Curves.ease;
        final curveTween = CurveTween(curve: curve);
        final tween = Tween(begin: begin, end: end).chain(curveTween);

        final offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
