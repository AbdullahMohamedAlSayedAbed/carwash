import 'package:flutter/material.dart';

class SmallTextWeidget extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  const SmallTextWeidget(
      {super.key,
      required this.title,
      this.size = 28,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
