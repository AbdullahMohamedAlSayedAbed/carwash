import 'package:carwash/Features/home/presentation/views/widgets/custom_secondary_button.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/models/details_wash_model.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_details_wash.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/widgets/custom_q_r_code.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class StandardWashViewBody extends StatelessWidget {
  const StandardWashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
  final List<DetailsWashModel> items =  [
    DetailsWashModel(
        title: S.of(context).DateAndTime,
        description: '11:30pm,12.12.2022',
        icon: Icons.date_range,
        iconColor: Colors.blue),
    DetailsWashModel(
        title: S.of(context).Location,
        description: '123 main st,Brooklyn NY 11201',
        icon: Icons.add_location,
        iconColor: Colors.blue),
    DetailsWashModel(
        title: S.of(context).paymentMethod,
        description: 'Apple Pay',
        icon: Icons.money,
        iconColor: Colors.green),
  ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ...List.generate(
              items.length,
              (index) => CustomDetailsWash(item: items[index]),
            ),
            Divider(
              color: Colors.grey[400],
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomQRCode(),
            const SizedBox(height: 5),
             Text(
              S.of(context).scanQR,
              style: AppStyles.style14Grey,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomSecondaryButton(
                    text: S.of(context).EditAppointment, onPressed: () {})),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                child: Text(S.of(context).CancelAppointment,
                    style:
                        AppStyles.style18.copyWith(color: AppColors.orange))),
          ],
        ),
      ),
    );
  }
}
