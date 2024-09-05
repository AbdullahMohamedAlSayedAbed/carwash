import 'package:carwash/Features/home/data/models/appointment_model.dart';
import 'package:carwash/Features/home/presentation/views/about_us_view.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_widget.dart';
import 'package:carwash/Features/home/presentation/views/widgets/your_appointment_widget.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/standard_wash_view.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  final List<AppointmentItemModel> items = const [
    AppointmentItemModel(
        title: 'Your Appointment',
        description: 'You dont have any \ncar wash appoinment yet',
        buttonText: 'Book Now',
        image: 'assets/images/car.webp'),
    AppointmentItemModel(
        title: 'Promotions',
        description: 'For our most loyal \ncustomers!',
        buttonText: 'Join now',
        image: 'assets/images/offer.jpeg'),
    AppointmentItemModel(
        title: 'About Us',
        description: 'Cheep \ncar wash about us',
        buttonText: 'Book Now',
        image: 'assets/images/car.webp'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('a clean car is a', style: AppStyles.style30w700),
            const Text('happy car!', style: AppStyles.style30w700),
            const SizedBox(height: 10),
            const CustomTextField(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.list, color: Colors.grey),
                hintText: 'search',
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
