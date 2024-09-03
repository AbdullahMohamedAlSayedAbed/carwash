import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({
    super.key,
    required this.text, this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBackgroundColor: AppColors.orange,
            backgroundColor: AppColors.orange,
            ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.style18,
        ));
  }
}
