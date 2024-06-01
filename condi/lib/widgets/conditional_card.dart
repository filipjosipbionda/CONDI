import 'package:condi/screens/theory_screens/form_or_usage_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionalCard extends StatelessWidget {
  final String conditionalType;

  const ConditionalCard({super.key, required this.conditionalType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FormOrUsageScreen(
              conditionalType: conditionalType,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 159, 99, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: 100,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  conditionalType,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
