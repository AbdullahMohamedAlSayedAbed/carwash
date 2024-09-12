import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomPaymentMethodWidget extends StatelessWidget {
  const CustomPaymentMethodWidget({
    super.key,
    required this.image,
    required this.title,
    required this.selected,
  });
  final String image;
  final String title;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5.0),
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.orange : Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                image,
              ),
            ),
            Text(title, style: AppStyles.style30w700),
          ],
        ));
  }
}
