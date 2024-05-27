import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  final TextEditingController controller;

  const LoginTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.white
                .withOpacity(0.5)), // Postavite boju teksta za podatak
        border: InputBorder.none, // Uklonite okvir TextFied-a
      ),
    );
  }
}
