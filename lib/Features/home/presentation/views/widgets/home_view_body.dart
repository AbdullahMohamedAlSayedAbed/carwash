import 'package:carwash/Features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_widget.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('a clean car is a', style: AppStyles.style30w700),
          Text('happy car!', style: AppStyles.style30w700),
          CustomTextField(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: Icon(Icons.list, color: Colors.grey),
              hintText: 'search',
              textInputType: TextInputType.text),
          SizedBox(height: 10),
          FeaturedServiceWidget(),
        ],
      ),
    );
  }
}
