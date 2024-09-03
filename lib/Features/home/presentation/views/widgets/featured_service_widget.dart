import 'package:carwash/Features/home/presentation/views/widgets/featured_service_list_view_separated.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class FeaturedServiceWidget extends StatelessWidget {
  const FeaturedServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Featured Services', style: AppStyles.style16w500),
        SizedBox(height: 10),
        SizedBox(
          height: 80,
          child: FeaturedServiceListViewSeparated(),
        ),
      ],
    );
  }
}
