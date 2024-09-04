import 'package:carwash/core/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      effect: const ExpandingDotsEffect(
        activeDotColor: AppColors.primaryColor,
        dotColor: AppColors.orange,
        dotHeight: 8,
        dotWidth: 14,
      ),
    );
  }
}
