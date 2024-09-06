import 'package:flutter/material.dart';

class CustomImageAppointment extends StatelessWidget {
  const CustomImageAppointment({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.circular(16), bottomEnd: Radius.circular(16)),
      child: Image.asset(
        name,
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 0.3,
        fit: BoxFit.fill,
      ),
    );
  }
}
