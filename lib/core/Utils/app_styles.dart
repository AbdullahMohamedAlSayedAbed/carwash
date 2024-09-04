import 'package:carwash/core/Utils/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const style30w700 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );
  static const style24w700 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );
  static const style16w500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static const style18 = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  static const style14White = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );
  static const style14Grey = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
}
