import 'package:carwash/Features/services/presentation/widgets/custom_card_details.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_card_title.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_text_icon_widget.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomRadioCardButton extends StatelessWidget {
  const CustomRadioCardButton({
    super.key,
    required this.list,
    this.image,
    required this.title,
    required this.imageTitle,
    required this.price,
    required this.selected,
    required this.onTap,
  });
  final List<String> list;
  final String? image;
  final String title;
  final String imageTitle;
  final String price;
  final bool selected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: selected ? AppColors.orange : Colors.grey),
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
                            image: image ?? AppImages.verifyImage,
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
            right: 15,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
