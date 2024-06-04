import 'dart:ui';
import 'package:condi/components/login_text_field.dart';
import 'package:condi/widgets/animated_login_text_field_container.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  bool userExist = true;
  bool isFieldEmpty = false;

  Future<bool> checkIfEmailExists(String email) async {
    try {
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (error) {
      print('Error checking email existence: $error');
      return false;
    }
  }

  void sendEmailForPasswordReset(String email) async {
    if (email.isEmpty) {
      setState(() {
        isFieldEmpty = true;
        userExist = true;  // Reset userExist to true to avoid displaying user not found message
      });
      return;
    }

    if (await checkIfEmailExists(email)) {
      setState(() {
        userExist = true;
        isFieldEmpty = false;
        FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email has been sent!'),
          ),
        );
        emailController.clear();
      });
    } else {
      setState(() {
        userExist = false;
        isFieldEmpty = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Forgot Password',
                style: GoogleFonts.inter(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "We will send you an email with a link to\nreset your password."
                " Please enter the email \nassociated with your account below",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedLoginTextFieldContainer(
                width: 300,
                height: 50,
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 159, 99, 255),
                direction: true,
                child: LoginTextField(
                    hintText: 'Your email address',
                    controller: emailController,
                    obscureText: false),
              ),
              Visibility(
                visible: isFieldEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 2),
                      child: Text(
                        'Please enter your email address!',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: !isFieldEmpty && !userExist,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 2),
                      child: Text(
                        'User with that email doesn\'t exist!',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  sendEmailForPasswordReset(emailController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(160, 46),
                    shadowColor: Colors.grey,
                    elevation: 5),
                child: Text(
                  'Send Email',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
