import 'package:flutter/material.dart';

class FeaturedServiceItemWidget extends StatelessWidget {
  const FeaturedServiceItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/car.webp'),
        ),
        Text('Exterior'),
      ],
    );
  }
}
