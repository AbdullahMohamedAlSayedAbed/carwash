import 'package:carwash/Features/appointment_promotions.dart/presentation/controllers/promotion_cubit/promotion_cubit.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/custom_card_promotions.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/custom_list_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromotionsViewBodyBlocBuilder extends StatelessWidget {
  const PromotionsViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionCubit, PromotionState>(
      builder: (context, state) {
        if (state is PromotionSuccess) {
          return ListView.separated(
            itemCount: state.data.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCardPromotions(
                promotionsEntity: state.data[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
          );
        } else if (state is PromotionFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const CustomListCardLoading();
        }
      },
    );
  }
}
