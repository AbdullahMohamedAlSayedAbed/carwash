import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key, required this.name, required this.email,
  });
  final String name ;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyles.style18.copyWith(color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
         Text(
          email,
          style: AppStyles.style16w500,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
