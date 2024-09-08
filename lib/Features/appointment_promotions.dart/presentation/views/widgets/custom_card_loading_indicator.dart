import 'package:carwash/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class CustomCardLoadingIndicator extends StatelessWidget {
  const CustomCardLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
        ),
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
      ),
    ));
  }
}
