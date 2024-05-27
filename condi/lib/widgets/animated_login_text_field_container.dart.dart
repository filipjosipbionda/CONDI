import 'package:condi/components/login_text_field.dart';
import 'package:flutter/material.dart';

class AnimatedLoginTextFieldContainer extends StatefulWidget {
  final double width;
  final double height;
  final bool direction;
  final Color color;

  final LoginTextField child;
  final Alignment alignment;
  const AnimatedLoginTextFieldContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.alignment,
      required this.color,
      required this.child,
      required this.direction});

  @override
  State<AnimatedLoginTextFieldContainer> createState() =>
      _AnimatedLoginTextFieldContainerState();
}

class _AnimatedLoginTextFieldContainerState
    extends State<AnimatedLoginTextFieldContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = widget.direction
        ? Tween<double>(begin: 4, end: 0).animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease))
        : Tween<double>(begin: -4, end: 0).animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset:
              Offset(MediaQuery.of(context).size.width * _animation.value, 0.0),
          child: Align(
            alignment: widget.alignment,
            child: child,
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.child,
      ),
    );
  }
}
