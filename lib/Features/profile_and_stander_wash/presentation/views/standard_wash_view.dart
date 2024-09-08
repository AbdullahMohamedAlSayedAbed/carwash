import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/standard_wash_view_body.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
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
        title:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).standardWash, style: AppStyles.style24w700),
            Text(S.of(context).yourAppointment, style: AppStyles.style16w500),
          ],
        ),
        centerTitle: true,
      ),
      body: const StandardWashViewBody(),
    );
  }
}
