import 'package:carwash/Features/profile_and_stander_wash/data/models/settings_item_model.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_car_type.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_image_profile.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_items_settings.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_user_name.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  final List<SettingsItemModel> items = const [
    SettingsItemModel(
        backgroundColor: Colors.blue, text: 'Edit Profile', icon: Icons.edit),
    SettingsItemModel(
        backgroundColor: Colors.blue,
        text: 'Payment Information',
        icon: Icons.payment),
    SettingsItemModel(
        backgroundColor: Colors.yellow,
        text: 'Loyalty Club',
        icon: Icons.loyalty),
    SettingsItemModel(
        backgroundColor: Colors.red, text: 'Log Out', icon: Icons.logout),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CustomImageProfile(),
                SizedBox(width: 10),
                CustomUserName(),
              ],
            ),
            const CustomCarType(),
            const SizedBox(height: 20),
            const Text('Settings', style: AppStyles.style20w700),
            const SizedBox(height: 10),
            ...List.generate(items.length, (index) {
              return CustomItemsSettings(item: items[index]);
            }),
          ],
        ),
      ),
    );
  }
}
