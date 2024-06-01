import 'package:condi/screens/conditional_screens/conditional_usage_screen.dart';
import 'package:condi/screens/theory_screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormOrUsageScreen extends StatefulWidget {
  final String conditionalType;
  const FormOrUsageScreen({
    super.key,
    required this.conditionalType,
  });

  @override
  State<FormOrUsageScreen> createState() => _FormOrUsageScreenState();
}

class _FormOrUsageScreenState extends State<FormOrUsageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          widget.conditionalType,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Form'),
            Tab(text: 'Usage'),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 159, 99, 255),
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FormScreen(conditionalType: widget.conditionalType),
          ConditionalUsageScreen(
            conditionalType: widget.conditionalType,
          )
        ],
      ),
    );
  }
}
