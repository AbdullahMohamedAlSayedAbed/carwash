import 'package:carwash/Features/profile_and_stander_wash/data/models/details_wash_model.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDetailsWash extends StatelessWidget {
  const CustomDetailsWash({
    super.key,
    required this.item,
  });
  final DetailsWashModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            item.icon,
            color: item.iconColor,
            size: 30,
          ),
          const SizedBox(width: 10),
          Text(item.title, style: AppStyles.style14Grey),
          const Spacer(),
          Text(item.description,
              style: AppStyles.style14Grey.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
