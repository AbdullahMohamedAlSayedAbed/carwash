import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomProcessAppBar extends StatelessWidget {
  const CustomProcessAppBar({
    super.key,
    required this.title,
    this.onPressed,
  });
  final Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Standard Wash',
                    style: AppStyles.style24w700,
                  ),
                  Text(
                    title,
                    style: AppStyles.style16w500,
                  )
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
