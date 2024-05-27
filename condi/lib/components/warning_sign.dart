import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningSign extends StatelessWidget {
  final List<String> messages;

  const WarningSign({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.warning,
                color: Colors.white,
                shadows: [],
              ),
              Text(
                'Be careful!',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          for (String item in messages)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                softWrap: true,
                item,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
