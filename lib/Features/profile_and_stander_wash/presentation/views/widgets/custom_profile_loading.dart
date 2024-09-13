import 'package:carwash/Features/home/presentation/views/widgets/custom_secondary_button.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/core/widgets/custom_fading_widget.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomProfileLoading extends StatelessWidget {
  const CustomProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[400],
              radius: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 100,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 20,
                  width: 200,
                  color: Colors.grey[400],
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),
            Text(S.of(context).CarType, style: AppStyles.style20w700),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/car_profile.jpeg',
                  height: 60,
                ),
                const SizedBox(width: 10),
                Text("carType",
                    style: AppStyles.style18.copyWith(color: Colors.grey)),
                const Spacer(),
                CustomSecondaryButton(
                    text: S.of(context).Change, onPressed: () {}),
              ],
            ),
          ],
        )
      ],
    ));
  }
}
