import 'package:flutter/material.dart';

class StartText extends StatelessWidget {
  final String text;
  final double size;
  final bool isVisible;
  final int duration;

  StartText({
    this.text,
    this.size,
    this.isVisible,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedOpacity(
          curve: Curves.linear,
          opacity: isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: duration),
          child: Text(
            text,
            style: TextStyle(
              fontSize: size,
            ),
          ),
        ),
      ),
    );
  }
}
