import 'package:carwash/core/Utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .5,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
