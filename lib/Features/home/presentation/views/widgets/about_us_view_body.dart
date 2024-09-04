import 'package:carwash/Features/home/presentation/views/widgets/custom_image_page_view_builder.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class AboutUsViewBody extends StatefulWidget {
  const AboutUsViewBody({super.key});

  @override
  State<AboutUsViewBody> createState() => _AboutUsViewBodyState();
}

class _AboutUsViewBodyState extends State<AboutUsViewBody> {
  final PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    CustomImagePageViewBuilder(),
                    SizedBox(height: 20),
                    Text(
                      'Convenient Car Care at Your Fingertips:',
                      style: AppStyles.style30w700,
                    ),
                    Text(
                      'At our car wash app, we understand the importance of convenience in your busy life. We have developed a user-friendly mobile application that allows you to schedule and manage your car wash appointments with just a few taps on your phone.',
                      style: AppStyles.style14Grey,
                    )
                  ],
                );
              }),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.5 - 60,
            top: MediaQuery.of(context).size.height * 0.3 + 10,
            child: CustomSmoothPageIndicator(controller: controller)),
        ],
      ),
    );
  }
}
