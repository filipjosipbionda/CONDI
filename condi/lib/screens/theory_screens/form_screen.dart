import 'package:condi/screens/conditional_screens/conditional_form_screen.dart';
import 'package:condi/screens/conditional_screens/conditional_negation_form_screen.dart';
import 'package:condi/screens/conditional_screens/conditional_question_form_screen.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final String conditionalType;

  const FormScreen({super.key, required this.conditionalType});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TabBar(

            labelColor: const Color.fromARGB(255, 159, 99, 255),
            controller: _tabController,
            tabs: const [
              Tab(text: 'Positive'),
              Tab(text: 'Negation'),
              Tab(text: 'Questions'),
            ],
          ),
          Expanded(
            child: TabBarView(

              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ConditionalFormScreen(
                      conditionalType: widget.conditionalType),
                ),
                ConditionalNegationFormScreen(
                    conditionalType: widget.conditionalType),
                ConditionalQuestionFormScreen(
                    conditionalType: widget.conditionalType),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
