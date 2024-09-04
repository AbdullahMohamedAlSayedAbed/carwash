import 'package:carwash/Features/home/presentation/views/widgets/custom_notifications_icon_button.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/profile_view_body.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile', style: AppStyles.style24w700),
        centerTitle: true,
        actions: const [
          CustomNotificationsIconButton(),
        ],
      ),
      body: const ProfileViewBody(),
    );
  }
}
