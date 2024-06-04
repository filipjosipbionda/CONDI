import 'package:condi/components/app_logo.dart';
import 'package:condi/components/login_text_field.dart';
import 'package:condi/components/square_tile.dart';
import 'package:condi/screens/auth/login_screen.dart';
import 'package:condi/screens/auth/username_input_screen.dart';
import 'package:condi/services/auth_services.dart';
import 'package:condi/widgets/animated_login_text_field_container.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actions: [
            GestureDetector(
              child: Text(
                'Got it',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
          alignment: Alignment.center,
          title: Text(
            message,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        print('User successfully signed up!');
      } else {
        Navigator.pop(context); // Uklonite CircularProgressIndicator
        showErrorMessage('Passwords don\'t match');
        return;
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.message!);
      return;
    }

    final User user = FirebaseAuth.instance.currentUser!;
    AuthService().saveUserData(user);
    Navigator.pop(context);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>  UsernameInputScreen()));
  }

  void signInWithGoogle() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final String email = googleUser.email;
      bool userExists = await AuthService().checkIfUserExistsByEmail(email);
      Navigator.pop(context);

      if (userExists) {
        await GoogleSignIn().signOut(); // Odjavi korisnika sa Google naloga
        showErrorMessage('User with that email already exists. Please log in.');
      } else {
        // Ako korisnik ne postoji, nastavi sa stvarnom prijavom
        User? user = await AuthService().signInWithGoogle();
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  UsernameInputScreen(),
            ),
          );
        } else {
          showErrorMessage('Google sign in failed. Please try again.');
        }
      }
    } else {
      Navigator.pop(context);
      showErrorMessage('Google sign in failed. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 260,
              ),
              const AppLogo(
                colorLeft: Color.fromARGB(255, 159, 99, 255),
                colorRight: Colors.purple,
              ),
              Text(
                'Let\'s create an account for you!',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  AnimatedLoginTextFieldContainer(
                    width: 300,
                    height: 50,
                    direction: true,
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 159, 99, 255),
                    child: LoginTextField(
                      obscureText: false,
                      controller: emailController,
                      hintText: 'email',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedLoginTextFieldContainer(
                    width: 300,
                    height: 50,
                    direction: false,
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 159, 99, 255),
                    child: LoginTextField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: 'password',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedLoginTextFieldContainer(
                    width: 300,
                    height: 50,
                    direction: true,
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 159, 99, 255),
                    child: LoginTextField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      hintText: 'confirm password',
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 6,
              ),
              ElevatedButton(
                onPressed: signUserUp,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(200, 46),
                    shadowColor: Colors.grey,
                    elevation: 5),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Colors.purple, thickness: 0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 159, 99, 255),
                              Colors.purple
                            ], // Promijenite boje prema potrebi
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Text(
                            'Or continue with', // Promijenite tekst prema potrebi
                            style: GoogleFonts.inter(
                                fontSize: 12, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: Colors.purple, thickness: 0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: const Color.fromARGB(255, 159, 99, 255), width: 5),
                ),
                child:
                  SquareTile(
                    onTap: signInWithGoogle,
                    imagePath: 'lib/images/google.png',
                  
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 159, 99, 255)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(_openLoginScreen());
                    },
                    child: Text(
                      'Login now',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route _openLoginScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
