import 'package:carwash/Features/appointment_promotions.dart/domin/entities/promotions_entity.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/widgets/custom_image_card.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_secondary_button.dart';
import 'package:carwash/Features/services/presentation/views/payment_method_screen.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCardPromotions extends StatelessWidget {
  const CustomCardPromotions({
    super.key,
    required this.promotionsEntity,
  });

  final PromotionsEntity promotionsEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5 - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        promotionsEntity.name ?? "no name",
                        style:
                            AppStyles.style16w500.copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Number: ${promotionsEntity.number}",
                        style: AppStyles.style14White,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    CustomSecondaryButton(
                        text: "join now",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PaymentMethodScreen()));
                        }),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomImageCard(image: promotionsEntity.image),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Amount: ${promotionsEntity.newPrice}\$\t",
                            style: AppStyles.style18,
                          ),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "${promotionsEntity.oldPrice}\$",
                            style: AppStyles.style18.copyWith(
                                decorationThickness: 3,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



