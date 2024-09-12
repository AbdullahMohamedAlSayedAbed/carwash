import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  const TextWidget(
      {super.key,
      required this.title,
      this.size = 28,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
      ),
    );
  }
}
