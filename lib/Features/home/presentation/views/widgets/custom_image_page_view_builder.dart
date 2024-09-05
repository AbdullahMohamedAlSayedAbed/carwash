import 'package:flutter/material.dart';

class CustomImagePageViewBuilder extends StatelessWidget {
  const CustomImagePageViewBuilder({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      // margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image:  DecorationImage(
            image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
