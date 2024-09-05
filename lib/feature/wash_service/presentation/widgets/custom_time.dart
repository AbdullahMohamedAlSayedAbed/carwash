import 'package:car_wash/core/utilities/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTime extends StatelessWidget {
  CustomTime({
    super.key,
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}
