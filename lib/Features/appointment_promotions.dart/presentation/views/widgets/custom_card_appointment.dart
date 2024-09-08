import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_secondary_button.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCardAppointment extends StatelessWidget {
  const CustomCardAppointment({
    super.key,
    required this.appointmentEntity,
  });
  final AppointmentEntity appointmentEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Card(
        clipBehavior: Clip.antiAlias,

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
                      appointmentEntity.name ?? "no name",
                      style:
                          AppStyles.style16w500.copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Number: ${appointmentEntity.number}",
                      style:
                          AppStyles.style14Grey.copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  CustomSecondaryButton(text: "Book Now", onPressed: () {}),
                ],
              ),
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: appointmentEntity.image ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Amount: ${appointmentEntity.price}\$",
                  style: AppStyles.style20w700,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
