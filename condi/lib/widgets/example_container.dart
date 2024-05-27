import 'package:flutter/cupertino.dart';

class ExampleContainer extends StatelessWidget {
  final Widget child;
  const ExampleContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 159, 99, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Center(child: child),
        ),
      ),
    );
  }
}
