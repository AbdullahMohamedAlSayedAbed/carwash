import 'package:car_wash/core/utilities/app_strings.dart';
import 'package:car_wash/feature/wash_service/presentation/widgets/custom_card_details.dart';
import 'package:car_wash/feature/wash_service/presentation/widgets/custom_card_title.dart';
import 'package:car_wash/feature/wash_service/presentation/widgets/custom_text_icon_widget.dart';
import 'package:flutter/material.dart';

class CustomRadioCardButton extends StatelessWidget {
  const CustomRadioCardButton({
    super.key,
    required this.list,
    this.image,
    required this.title,
    required this.imageTitle,
    required this.price,
  });
  final List<String> list;
  final String? image;
  final String title;
  final String imageTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCardTitle(imageTitle: imageTitle, title: title),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: CustomCardDetails(
                          title1: list[0],
                          title2: list[2],
                          image: image ?? AppStrings.verigyImage,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextIconWidget(
                              label: list[1],
                            ),
                            CustomTextIconWidget(
                              label: list[3],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 5,
          top: 35,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$price\$',
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Radio(
                value: 'premium',
                groupValue: 'groupValue',
                onChanged: (onChanged) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
