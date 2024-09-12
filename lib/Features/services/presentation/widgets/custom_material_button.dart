import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.color = const Color(0xffE57533),
  });
  final bool isLoading;
  final String label;
  final Function()? onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      height: 50,
      minWidth: double.infinity,
      color: color,
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
    );
  }
}
