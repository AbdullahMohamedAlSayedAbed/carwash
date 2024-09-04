import 'package:flutter/material.dart';

class CustomImagePageViewBuilder extends StatelessWidget {
  const CustomImagePageViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      // margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
            image: AssetImage('assets/images/car.webp'), fit: BoxFit.fill),
      ),
    );
  }
}
