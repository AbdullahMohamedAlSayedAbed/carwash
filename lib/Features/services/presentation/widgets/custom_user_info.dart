import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({
    super.key,
    required this.title,
    this.image,
    required this.value,
    this.titleStyle,
    this.valueStyle,
  });
  final String title;
  final String? image;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image == null
            ? const SizedBox()
            : Image.asset(
                image!,
                height: 20,
                width: 20,
              ),
        Text(title, style: titleStyle ?? AppStyles.style16w500),
        const Spacer(),
        Text(value, style: valueStyle ?? AppStyles.styleBold16),
      ],
    );
  }
}
