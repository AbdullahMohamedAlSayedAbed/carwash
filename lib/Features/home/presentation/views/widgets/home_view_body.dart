import 'package:carwash/Features/appointment_promotions.dart/presentation/views/promotions_view.dart';
import 'package:carwash/Features/home/data/models/appointment_model.dart';
import 'package:carwash/Features/home/presentation/views/about_us_view.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_widget.dart';
import 'package:carwash/Features/home/presentation/views/widgets/your_appointment_widget.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/standard_wash_view.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppointmentItemModel> items = [
      AppointmentItemModel(
          title: S.of(context).yourAppointment,
          description: S.of(context).supAppointment,
          buttonText: S.of(context).bookNow,
          image: 'assets/images/car.webp'),
      AppointmentItemModel(
          title: S.of(context).Promotions,
          description: S.of(context).supPromotions,
          buttonText: S.of(context).JoinNow,
          image: 'assets/images/offer.jpeg'),
      AppointmentItemModel(
          title: S.of(context).AboutUs,
          description: S.of(context).supAboutUs,
          buttonText: S.of(context).bookNow,
          image: 'assets/images/car.webp'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).title, style: AppStyles.style30w700),
            // const Text('happy car!', style: AppStyles.style30w700),
            const SizedBox(height: 10),
            CustomTextField(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.list, color: Colors.grey),
                hintText: S.of(context).search,
                textInputType: TextInputType.text),
            const SizedBox(height: 10),
            const FeaturedServiceWidget(),
            Column(
                children: List.generate(
              items.length,
              (index) => GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StandardWashView()));
                  } else if (index == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsView()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PromotionsView()));
                  }
                },
                child: YourAppointmentWidget(
                  item: items[index],
                ),
              ),
            )),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
