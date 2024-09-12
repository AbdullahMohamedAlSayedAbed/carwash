import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final bool obscureText;
  final IconData? icon;
  final VoidCallback? onIconPressed;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.placeholder,
    this.obscureText = false,
    this.icon,
    this.onIconPressed,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: icon != null
            ? IconButton(
                icon: Icon(icon),
                onPressed: onIconPressed,
              )
            : null,
      ),
      validator: validator,
    );
  }
}
