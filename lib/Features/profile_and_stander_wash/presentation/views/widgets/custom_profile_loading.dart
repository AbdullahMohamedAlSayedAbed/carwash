import 'package:carwash/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class CustomProfileLoading extends StatelessWidget {
  const CustomProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[400],
          radius: 40,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 100,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 10),
            Container(
              height: 20,
              width: 200,
              color: Colors.grey[400],
            ),
          ],
        )
      ],
    ));
  }
}
