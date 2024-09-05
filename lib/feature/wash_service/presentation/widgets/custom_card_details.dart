import 'package:car_wash/feature/wash_service/presentation/widgets/custom_text_icon_widget.dart';
import 'package:flutter/material.dart';

class CustomCardDetails extends StatelessWidget {
  const CustomCardDetails({
    super.key,
    required this.title1,
    required this.image,
    required this.title2,
  });

  final String title1;
  final String title2;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextIconWidget(
          label: title1,
          image: image,
          height: 30,
        ),
        CustomTextIconWidget(
          label: title2,
        ),
      ],
    );
  }
}
