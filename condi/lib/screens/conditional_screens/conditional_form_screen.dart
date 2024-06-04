import 'dart:ui';
import 'package:condi/components/warning_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:condi/data/conditionals.dart';

class ConditionalFormScreen extends StatefulWidget {
  final String conditionalType;

  const ConditionalFormScreen({super.key, required this.conditionalType});

  @override
  _ConditionalFormScreenState createState() => _ConditionalFormScreenState();
}

class _ConditionalFormScreenState extends State<ConditionalFormScreen> {
  @override
  Widget build(BuildContext context) {
    var cautions =
        conditionals[widget.conditionalType]!['beCareful'] as List<String>;
    var startingExample =
        conditionals[widget.conditionalType]!['startingExample'].toString();
    var formText = conditionals[widget.conditionalType]!['formText'].toString();
    var examples =
        conditionals[widget.conditionalType]!['examples'] as List<RichText>;

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  conditionals[widget.conditionalType]!['introductionTitle']!
                      as String,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child:
                  conditionals[widget.conditionalType]!['imageForm'] as Widget),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              startingExample,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 16),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                'How do we form it?',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
              padding: const EdgeInsets.all(10),
              child:
                  conditionals[widget.conditionalType]!['imageTense'] as Widget),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  formText,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: WarningSign(
              messages: cautions,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 16),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                'Examples',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          for (RichText item in examples)
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: item,
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
