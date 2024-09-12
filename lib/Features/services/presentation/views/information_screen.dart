import 'package:carwash/Features/services/presentation/views/payment_method_screen.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_material_button.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_process_app_bar.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_stepper.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_user_info.dart';
import 'package:carwash/core/Utils/app_images.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProcessAppBar(
                title: 'overView',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PaymentMethodScreen();
                  }));
                },
              ),
              const CustomStepper(
                activeStepper: 3,
              ),
              const Text('Standard Wash', style: AppStyles.style24w700),
              const SizedBox(
                height: 10,
              ),
              const CustomUserInfo(
                image: 'assets/images/date_picker.png',
                title: 'Date and time',
                value: '11:30 AM, 11.05.2023',
              ),
              const CustomUserInfo(
                image: AppImages.locationImage,
                title: 'Location',
                value: '123 Main St, Brooklyn NY 11201',
              ),
              const CustomUserInfo(
                image: AppImages.appleImage,
                title: 'Payment method',
                value: 'Apple pay',
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const Spacer(),
              const CustomUserInfo(
                title: 'Price:',
                value: '15\$',
                titleStyle: AppStyles.style20w700,
                valueStyle: AppStyles.style20w700,
              ),
              const CustomUserInfo(
                title: 'Loyalty club discount:',
                value: '0\$',
                titleStyle: AppStyles.style20w700,
                valueStyle: AppStyles.style20w700,
              ),
              const Divider(),
              CustomMaterialButton(
                label: 'Next',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
