import 'package:condi/components/app_logo.dart';
import 'package:condi/components/login_text_field.dart';
import 'package:condi/components/square_tile.dart';
import 'package:condi/screens/auth/forgot_password_screen.dart';
import 'package:condi/screens/home/home_screen.dart';
import 'package:condi/screens/auth/register_screen.dart';
import 'package:condi/services/auth_services.dart';
import 'package:condi/widgets/animated_login_text_field_container.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (ctx) {
        return SizedBox(
          width: 300,
          child: AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
            alignment: Alignment.center,
            title: Container(
              alignment: Alignment.center,
              child: Text(
                message,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('User successfully signed in!');
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      print(error.code);
      if (error.code == 'user-not-found') {
        showErrorMessage('Incorrect Email');
      } else if (error.code == 'wrong-password') {
        passwordController.clear();
        showErrorMessage('Incorrect Password');
      }
    }
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 300),
              const AppLogo(
                colorLeft: Color.fromARGB(255, 159, 99, 255),
                colorRight: Colors.purple,
              ),
              Text(
                'Welcome back you\'ve been missed!',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  AnimatedLoginTextFieldContainer(
                    width: 300,
                    height: 50,
                    direction: false,
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 159, 99, 255),
                    child: LoginTextField(
                      obscureText: false,
                      controller: emailController,
                      hintText: 'email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  AnimatedLoginTextFieldContainer(
                    width: 300,
                    height: 50,
                    direction: true,
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 159, 99, 255),
                    child: LoginTextField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: 'password',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color.fromARGB(255, 159, 99, 255)
                              .withOpacity(0.75),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: signUserIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(200, 46),
                  shadowColor: Colors.grey,
                  elevation: 5,
                ),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
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
                              Colors.purple,
                              Color.fromARGB(255, 159, 99, 255)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 159, 99, 255),
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    onTap: () async {
                      try {
                        await AuthService().signInWithGoogle();
                        User? user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }),
                          );
                        }
                      } catch (e) {
                        showErrorMessage('Google sign-in failed');
                      }
                    },
                    imagePath: 'lib/images/google.png',
                  ),
                  const SizedBox(width: 32),
                  SquareTile(
                    onTap: () async {
                      try {
                        await AuthService().signInWithFacebook(context);
                        User? user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }),
                          );
                        }
                      } catch (e) {
                        showErrorMessage('Facebook sign-in failed');
                      }
                    },
                    imagePath: 'lib/images/facebook.png',
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member yet?',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 159, 99, 255),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(_openRegisterScreen());
                    },
                    child: Text(
                      'Register now',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Route _openRegisterScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const RegisterScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1, 0.0);
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
