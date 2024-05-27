import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsageSection extends StatelessWidget {
  final Widget usageDefinition;
  final Widget usageExample;
  const UsageSection(
      {super.key, required this.usageDefinition, required this.usageExample});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        usageDefinition,
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Example:',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        usageExample,
      ],
    );
  }
}
