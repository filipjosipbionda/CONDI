import 'package:condi/widgets/example_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsageExampleContainer extends StatelessWidget {
  final String text;
  const UsageExampleContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ExampleContainer(
      child: RichText(
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: text,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
