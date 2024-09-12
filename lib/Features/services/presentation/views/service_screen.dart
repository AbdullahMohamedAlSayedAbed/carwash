import 'package:carwash/Features/services/presentation/widgets/custom_app_bar.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_material_button.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_radio_card_button.dart';
import 'package:carwash/core/Utils/app_images.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int? index;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomRadioCardButton(
              list: const [
                'Exterior wash',
                'Vacuuming',
                'Trye cleaning',
                'Hand drying'
              ],
              price: '15',
              title: 'Standard wash',
              imageTitle: AppImages.standardWashImage,
              selected: index == 0,
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRadioCardButton(
              list: const [
                'Standard wash',
                'Trye cleaning',
                'Engine detaling',
                'Hand drying'
              ],
              price: '45',
              title: 'Deluxe wash',
              imageTitle: AppImages.deluxeWashImage,
              image: AppImages.standardWashImage,
              selected: index == 1,
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRadioCardButton(
              list: const [
                'Deluxe wash',
                'Full detailing',
                'Deep Cleaning ',
                'Headlight restroration'
              ],
              selected: index == 2,
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              price: '95',
              title: 'Deluxe wash',
              image: AppImages.deluxeWashImage,
              imageTitle: AppImages.premiumWashImage,
            ),
            const Spacer(),
            index == null
                ? const SizedBox()
                : CustomMaterialButton(
                    label: 'Book Now',
                    onPressed: () {},
                  )
          ],
        ),
      ),
    );
  }
}
