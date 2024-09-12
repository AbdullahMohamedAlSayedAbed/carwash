import 'package:carwash/Features/login/presentation/screens/login.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/models/settings_item_model.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/cubit/get_profile_data_cubit.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_car_type.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_image_profile.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_items_settings.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_profile_loading.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_user_name.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/language_select_widget.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final List<SettingsItemModel> items = [
      SettingsItemModel(
        backgroundColor: Colors.blue,
        text: S.of(context).EditProfile,
        icon: Icons.edit,
      ),
      SettingsItemModel(
          backgroundColor: Colors.blue,
          text: S.of(context).PaymentInformation,
          icon: Icons.payment),
      SettingsItemModel(
          backgroundColor: Colors.yellow,
          text: S.of(context).LoyaltyClub,
          icon: Icons.loyalty),
      SettingsItemModel(
        backgroundColor: Colors.red,
        text: S.of(context).LogOut,
        icon: Icons.logout,
        onTap: () async {
          await FirebaseAuth.instance.signOut();

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Login()),
            (Route<dynamic> route) => false,
          );
        },
      ),
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
                builder: (context, state) {
              if (state is GetProfileDataFailure) {
                return Text('error : ${state.errMessage}');
              }
              if (state is GetProfileDataSuccess) {
                return Row(
                  children: [
                    CustomImageProfile(image: state.userEntity.image),
                    const SizedBox(width: 10),
                    CustomUserName(
                      email: state.userEntity.email,
                      name: state.userEntity.name,
                    ),
                  ],
                );
              }
              return const CustomProfileLoading();
            }),
            const CustomCarType(),
            const SizedBox(height: 20),
            Text(S.of(context).Settings, style: AppStyles.style20w700),
            const SizedBox(height: 10),
            ...List.generate(items.length, (index) {
              return CustomItemsSettings(item: items[index]);
            }),
            const SizedBox(height: 20),
            Text(S.of(context).appLanguage, style: AppStyles.style20w700),
            const SizedBox(height: 10),
            const LanguageSelector(),
          ],
        ),
      ),
    );
  }
}
