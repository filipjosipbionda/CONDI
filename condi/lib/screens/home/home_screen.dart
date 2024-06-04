import 'package:condi/components/app_logo.dart';
import 'package:condi/screens/auth/login_screen.dart';
import 'package:condi/screens/home/materials_screen.dart';
import 'package:condi/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() async {
    try {
      print('User logging out!');

      AuthService().signOut();
      Navigator.of(context).pushReplacement(_returnToLoginScreen());
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLogo(
                  colorLeft: Color.fromARGB(255, 159, 99, 255),
                  colorRight: Color.fromARGB(255, 225, 131, 241),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ))
        ],
      ),
      body: const MaterialsScreen(),
    );
  }

  Route _returnToLoginScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
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
