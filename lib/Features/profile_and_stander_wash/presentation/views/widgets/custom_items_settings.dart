import 'package:carwash/Features/profile_and_stander_wash/data/models/settings_item_model.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomItemsSettings extends StatelessWidget {
  const CustomItemsSettings({
    super.key,
    required this.item,
  });

  final SettingsItemModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: item.backgroundColor,
              child: Icon(item.icon, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(item.text,
                style: AppStyles.style16w500.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
