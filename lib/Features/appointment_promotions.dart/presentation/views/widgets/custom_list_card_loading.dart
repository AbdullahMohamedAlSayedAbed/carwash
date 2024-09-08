import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/custom_card_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomListCardLoading extends StatelessWidget {
  const CustomListCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const CustomCardLoadingIndicator(),
      itemCount: 3,
    );
  }
}
