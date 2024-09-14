import 'package:carwash/Features/home/presentation/views/widgets/custom_notifications_icon_button.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/repo/profile_repo_impl.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/image_picker_cubit/image_picker_cubit.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/profile_view_body.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/core/services/get_it_service.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(S.of(context).Profile, style: AppStyles.style24w700),
        centerTitle: true,
        actions: const [
          CustomNotificationsIconButton(),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetProfileDataCubit(getIt<ProfileRepoImpl>())..getProfileData(),
          ),
          BlocProvider(
            create: (context) => ImagePickerCubit(getIt<ImagePicker>()),
          ),
        ],
        child: const ProfileViewBody(),
      ),
    );
  }
}
