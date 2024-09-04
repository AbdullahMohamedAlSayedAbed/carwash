import 'package:carwash/Features/home/presentation/views/widgets/custom_secondary_button.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCarType extends StatelessWidget {
  const CustomCarType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 1,
          color: Colors.grey,
          height: 20,
        ),
        const Text('Car Type', style: AppStyles.style20w700),
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
            Text('Coupe',
                style: AppStyles.style18.copyWith(color: Colors.grey)),
            const Spacer(),
            CustomSecondaryButton(text: 'Change', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
