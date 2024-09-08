import 'package:carwash/Features/appointment_promotions.dart/data/repo/appointment_repo_impl.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/controllers/appointment_cubit/appointment_cubit.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/appointment_view_body.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/services/get_it_service.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppointmentCubit(getIt<AppointmentAndPromotionRepoImpl>())
            ..getAppointment(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          title: Text(S.of(context).Appointments),
        ),
        body: const AppointmentViewBody(),
      ),
    );
  }
}
