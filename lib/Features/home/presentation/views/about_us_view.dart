import 'package:carwash/Features/home/presentation/views/widgets/about_us_view_body.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_notifications_icon_button.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title:  Text(S.of(context).AboutUs),
        actions: const [
          CustomNotificationsIconButton(),
        ],
      ),
      body: const AboutUsViewBody(),
    );
  }
}
