import 'package:car_wash/feature/wash_service/presentation/views/services/date_time_screen.dart';
import 'package:flutter/material.dart';

class CarWash extends StatelessWidget {
  const CarWash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateTimeScreen(
        activeStep: 1,
      ),
    );
  }
}
