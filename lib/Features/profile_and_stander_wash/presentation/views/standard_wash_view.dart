import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/standard_wash_view_body.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class StandardWashView extends StatelessWidget {
  const StandardWashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Standard Wash', style: AppStyles.style24w700),
            Text('Your appointments', style: AppStyles.style16w500),
          ],
        ),
        centerTitle: true,
      ),
      body: const StandardWashViewBody(),
    );
  }
}
