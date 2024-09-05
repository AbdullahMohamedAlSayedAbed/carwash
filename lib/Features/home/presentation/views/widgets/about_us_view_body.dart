import 'package:carwash/Features/home/data/models/about_us_model.dart';
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
  final List<AboutUsModel> aboutUsList = [
    const AboutUsModel(
        title: 'Convenient Car Care at Your Fingertips:',
        description:
            'At our car wash app, we understand the importance of convenience in your busy life. We have developed a user-friendly mobile application that allows you to schedule and manage your car wash appointments with just a few taps on your phone',
        image: 'assets/images/pageview1.png'),
    const AboutUsModel(
        title: 'Unmatched Quality and Attention to Detail:',
        description:
            'We pride ourselves on delivering an exceptional car wash experience with unmatched quality and attention to detail. Our team of trained professionals sises the latest techniques and eco- friendly products to ensure that your vehicle receives the care it deserves.',
        image: 'assets/images/pageview2.jpeg'),
    const AboutUsModel(
        title: 'Customizable Services to Suit Your Needs:',
        description:
            'Every car has unique needs, which is why our car wash app offers customizatile services to suit your specific requirements. Whether you need a quick exterior wash or a comprehensive package that Includes waxing, polishing, and interior detalling. our app allows you to select the services that best fit your needs and budget',
        image: 'assets/images/pageview3.jpeg'),
  ];
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
