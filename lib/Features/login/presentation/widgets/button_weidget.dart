import 'package:carwash/Features/login/presentation/widgets/text.dart';
import 'package:flutter/material.dart';

class ButtonWeidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const ButtonWeidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFA500),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                title: text,
                size: 19,
              ),
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                )
            ],
          )),
    );
  }
}
