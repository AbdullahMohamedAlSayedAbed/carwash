import 'package:carwash/Features/home/presentation/views/widgets/featured_service_list_view_separated.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class FeaturedServiceWidget extends StatelessWidget {
  const FeaturedServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).featuredService, style: AppStyles.style16w500),
        const SizedBox(height: 10),
        const SizedBox(
          height: 80,
          child: FeaturedServiceListViewSeparated(),
        ),
      ],
    );
  }
}
