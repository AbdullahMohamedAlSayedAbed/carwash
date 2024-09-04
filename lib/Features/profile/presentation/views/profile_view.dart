import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_notifications_icon_button.dart';
import 'package:carwash/Features/profile/presentation/views/widgets/custom_image_profile.dart';
import 'package:carwash/core/Utils/app_color.dart';
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

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [CustomImageProfile()],
        )
      ],
    );
  }
}
