import 'package:carwash/core/Utils/app_images.dart';
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
              image ?? AppImages.verifyImage,
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
