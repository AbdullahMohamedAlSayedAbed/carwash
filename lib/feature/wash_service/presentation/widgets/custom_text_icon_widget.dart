import 'package:car_wash/core/utilities/app_strings.dart';
import 'package:flutter/material.dart';

class CustomTextIconWidget extends StatelessWidget {
  const CustomTextIconWidget({
    super.key,
    required this.label,
    this.image,
    this.height,
  });
  final String label;
  final String? image;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Image.asset(
              image ?? AppStrings.verigyImage,
              height: height ?? 30,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
