import 'package:carwash/Features/appointment_promotions.dart/presentation/controllers/cubit/appointment_cubit.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/custom_card_appointment.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/custom_card_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentViewBody extends StatelessWidget {
  const AppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        if (state is AppointmentSuccess) {
          return ListView.separated(
            itemCount: state.data.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCardAppointment(
                  appointmentEntity: state.data[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
          );
        } else if (state is AppointmentFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => const CustomCardLoadingIndicator(),
            itemCount: 3,
          );
        }
      },
    );
  }
}
