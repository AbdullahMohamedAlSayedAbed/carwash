import 'package:carwash/Features/home/data/models/about_us_model.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_image_page_view_builder.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
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
  final List<AboutUsModel> aboutUsList = [
     AboutUsModel(
        title: S.of(context).titlePageView1,
        description:S.of(context).descriptionPageView1,
                image: 'assets/images/pageview1.png'),
     AboutUsModel(
          title: S.of(context).titlePageView2,
          description: S.of(context).descriptionPageView2,
                  image: 'assets/images/pageview2.jpeg'),
     AboutUsModel(
          title: S.of(context).titlePageView3,
          description: S.of(context).descriptionPageView3,
        image: 'assets/images/pageview3.jpeg'),
  ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: aboutUsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomImagePageViewBuilder(image: aboutUsList[index].image),
                    const SizedBox(height: 20),
                    Text(
                      aboutUsList[index].title,
                      style: AppStyles.style30w700,
                    ),
                    Text(
                      aboutUsList[index].description,
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
