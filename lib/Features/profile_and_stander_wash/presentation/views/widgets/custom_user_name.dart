import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Mark Smith',
          style: AppStyles.style18.copyWith(color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
        const Text(
          'personal info',
          style: AppStyles.style16w500,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
