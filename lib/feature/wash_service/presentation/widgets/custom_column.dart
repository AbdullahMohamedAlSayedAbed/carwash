import 'package:car_wash/core/utilities/app_color.dart';
import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Select your date and time',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            'Select days when wash is available',
            style: TextStyle(color: AppColor.greyColor, fontSize: 15),
          )
        ],
      )
    ]);
  }
}
