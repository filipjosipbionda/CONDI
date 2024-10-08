import 'package:condi/components/app_logo.dart';
import 'package:condi/components/login_text_field.dart';
import 'package:condi/components/square_tile.dart';
import 'package:condi/screens/auth/forgot_password_screen.dart';
import 'package:condi/screens/home/home_background.dart';
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
  final AuthService _authService = AuthService();

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

  void signUserIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showErrorMessage('Please enter your email and password');
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      User? user = await _authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      Navigator.pop(context);
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeBackground(),
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);

      if (error.code == 'user-not-found') {
        showErrorMessage('Incorrect Email');
      } else if (error.code == 'wrong-password') {
        passwordController.clear();
        showErrorMessage('Incorrect Password');
      }
    }

    passwordController.clear();
  }

  void signInWithGoogle() async {
    try {
      User? user = await _authService.signInWithGoogle();
      if (user == null) {
        showErrorMessage('Google sign-in cancelled');
        return;
      }

      bool userExists = await _authService.checkIfUserExistsByEmail(user.email!);
      if (!userExists) {
        showErrorMessage('Please register before signing in with Google');
        await _authService.signOut(); // Sign out if user is not registered
        return;
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const HomeBackground();
        }),
      );
    } catch (e) {
      showErrorMessage('Google sign-in failed');
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
              const SizedBox(height: 260),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 5,
                    color: const Color.fromARGB(255, 159, 99, 255),
                  ),
                ),
                child: SquareTile(
                  onTap: signInWithGoogle,
                  imagePath: 'lib/images/google.png',
                ),
              ),
              const SizedBox(height: 16),
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
