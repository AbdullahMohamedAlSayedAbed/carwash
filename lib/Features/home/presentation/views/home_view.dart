import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).HeryMark),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Badge.count(
                  count: 1,
                  child: const Icon(
                    Icons.notifications,
                    color: AppColors.primaryColor,
                  ),
                ))
          ],
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('a clean car is a', style: AppStyles.style30w700),
            Text('happy car!', style: AppStyles.style30w700),
          ],
        ));
  }
}
