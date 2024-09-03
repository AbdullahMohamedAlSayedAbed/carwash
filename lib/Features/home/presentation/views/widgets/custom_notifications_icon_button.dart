import 'package:carwash/core/Utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomNotificationsIconButton extends StatelessWidget {
  const CustomNotificationsIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Badge.count(
          count: 1,
          child: const Icon(
            Icons.notifications,
            color: AppColors.primaryColor,
          ),
        ));
  }
}
