import 'package:carwash/Features/appointment_promotions.dart/data/repo/appointment_repo_impl.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/controllers/promotion_cubit/promotion_cubit.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/promotions_view_body_bloc_builder.dart';
import 'package:carwash/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromotionsViewBody extends StatelessWidget {
  const PromotionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PromotionCubit(getIt<AppointmentAndPromotionRepoImpl>())
            ..getPromotion(),
      child: const PromotionsViewBodyBlocBuilder(),
    );
  }
}
