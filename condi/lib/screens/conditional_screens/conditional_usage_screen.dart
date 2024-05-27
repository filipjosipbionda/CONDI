import 'package:condi/data/conditionals.dart';
import 'package:condi/widgets/usage_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionalUsageScreen extends StatelessWidget {
  final String conditionalType;

  const ConditionalUsageScreen({super.key, required this.conditionalType});

  @override
  Widget build(BuildContext context) {
    var usages = conditionals[conditionalType]!['usageExamples']
        as Map<String, List<Widget>>;

    var usageExamples = usages['usageExamples'] as List<Widget>;
    var usageDefinitions = usages['usageDefinitions'] as List<Widget>;

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              '${conditionalType} is used: ',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: usageDefinitions.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  UsageSection(
                    usageDefinition: usageDefinitions[index],
                    usageExample: usageExamples[index],
                  ),
                  if (index + 1 != usageDefinitions.length)
                    const Divider(
                      height: 40,
                    )
                  else
                    const SizedBox(
                      height: 18,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
