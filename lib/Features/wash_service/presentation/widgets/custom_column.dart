import 'package:carwash/core/Utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  CustomColumn({
    super.key,
    required this.text1,
    required this.text2,
  });
  String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text1,
            // 'Select your date and time',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            text2,
            // 'Select days when wash is available',
            style: const TextStyle(color: AppColors.greyColor, fontSize: 15),
          )
        ],
      )
    ]);
  }
}
