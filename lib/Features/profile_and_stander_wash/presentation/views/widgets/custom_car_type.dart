import 'package:carwash/Features/home/presentation/views/widgets/custom_secondary_button.dart';
import 'package:carwash/Features/login/presentation/screens/car_type.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomCarType extends StatelessWidget {
  const CustomCarType({
    super.key, required this.carType,
  });
  final String carType;
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
            Text(carType,
                style: AppStyles.style18.copyWith(color: Colors.grey)),
            const Spacer(),
            CustomSecondaryButton(text: S.of(context).Change, onPressed: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: 
              (context) => const CarType(),));
            }),
          ],
        ),
      ],
    );
  }
}
