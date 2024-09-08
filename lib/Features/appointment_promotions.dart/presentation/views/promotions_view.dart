import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/promotions_view_body.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class PromotionsView extends StatelessWidget {
  const PromotionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        title:  Text(S.of(context).Promotions),
      ),
      body: const PromotionsViewBody(),
    );
  }
}
