import 'package:carwash/Features/home/presentation/views/widgets/custom_notifications_icon_button.dart';
import 'package:carwash/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/repo/profile_repo_impl.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/cubit/get_profile_data_cubit.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/services/firestore_service.dart';
import 'package:carwash/core/services/get_it_service.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProfileDataCubit(
          ProfileRepoImpl(databaseService: FireStoreService()))
        ..getProfileData(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
              builder: (context, state) {
                if (state is GetProfileDataFailure) {
                  return Text(
                      "${S.of(context).hey} no Name");
                }

                if (state is GetProfileDataSuccess) {
                  return Text(
                      "${S.of(context).hey} ${state.userEntity.name}");
                }
                else {
                  return Text(
                      "${S.of(context).hey} name loading");
                }
              },
            ),
            actions: const [CustomNotificationsIconButton()],
          ),
          body: const HomeViewBody(),
        );
      }),
    );
  }
}
