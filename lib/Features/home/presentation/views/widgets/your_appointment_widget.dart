import 'package:carwash/Features/home/data/models/appointment_model.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_image_appointment.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_secondary_button.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_route.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class YourAppointmentWidget extends StatelessWidget {
  const YourAppointmentWidget({super.key, required this.item});
  final AppointmentItemModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.aboutUs);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(item.title, style: AppStyles.style16w500),
          const SizedBox(height: 10),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        item.description,
                        style: AppStyles.style18,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CustomSecondaryButton(
                        onPressed: item.onPressed,
                        text: item.buttonText,
                      )
                    ],
                  ),
                ),
                CustomImageAppointment(
                  name: item.image,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
