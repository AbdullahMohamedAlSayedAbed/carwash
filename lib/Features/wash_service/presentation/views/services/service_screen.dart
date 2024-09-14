import 'package:carwash/Features/wash_service/presentation/widgets/custom_app_bar.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_material_button.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_radio_card_button.dart';
import 'package:carwash/core/Utils/app_strings.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Services',
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 26),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomRadioCardButton(
              list: ['Exterior wash', 'Vacuuming', 'Trye cleaning', 'Hand drying'],
              price: '15',
              title: 'Standard wash',
              imageTitle: AppStrings.pronzyMedal,
            ),
            SizedBox(
              height: 20,
            ),
            CustomRadioCardButton(
              list: ['Standard wash', 'Trye cleaning', 'Engine detaling', 'Hand drying'],
              price: '45',
              title: 'Deluxe wash',
              imageTitle: AppStrings.sliverMedal,
              image: AppStrings.pronzyMedal,
            ),
            SizedBox(
              height: 20,
            ),
            CustomRadioCardButton(
              list: ['Deluxe wash', 'Full detailing', 'Deep Cleaning ', 'Headlight restroration'],
              price: '95',
              title: 'Deluxe wash',
              image: AppStrings.sliverMedal,
              imageTitle: AppStrings.goldenMedal,
            ),
            Spacer(),
            CustomMaterialButton(
              label: 'Book Now',
            )
          ],
        ),
      ),
    );
  }
}
