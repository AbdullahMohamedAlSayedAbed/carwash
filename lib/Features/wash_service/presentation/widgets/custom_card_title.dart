import 'package:flutter/material.dart';

class CustomCardTitle extends StatelessWidget {
  const CustomCardTitle({
    super.key,
    required this.imageTitle,
    required this.title,
  });

  final String imageTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageTitle,
          height: 50,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
