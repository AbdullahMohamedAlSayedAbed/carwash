import 'package:flutter/material.dart';

class Blububle extends StatelessWidget {
  final double size;

  const Blububle({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/bluebuble3.png',
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }
}
