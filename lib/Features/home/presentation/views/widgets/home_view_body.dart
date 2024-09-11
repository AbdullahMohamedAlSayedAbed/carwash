import 'package:carwash/Features/appointment_promotions.dart/presentation/views/appointment_view.dart';
import 'package:carwash/Features/appointment_promotions.dart/presentation/views/promotions_view.dart';
import 'package:carwash/Features/home/data/models/Services_item_model.dart';
import 'package:carwash/Features/home/data/models/appointment_model.dart';
import 'package:carwash/Features/home/presentation/controllers/cubit/services_item_cubit.dart';
import 'package:carwash/Features/home/presentation/views/about_us_view.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:carwash/Features/home/presentation/views/widgets/featured_service_widget.dart';
import 'package:carwash/Features/home/presentation/views/widgets/your_appointment_widget.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        final List<ServicesItemModel> initialItems = [
      ServicesItemModel(
          image: 'assets/images/exterior.jpeg', title: S.of(context).Exterior),
      ServicesItemModel(
          image: 'assets/images/interior.jpeg', title: S.of(context).interior),
      ServicesItemModel(
          image: 'assets/images/detailing.jpeg',
          title: S.of(context).Detailing),
      ServicesItemModel(
          image: 'assets/images/polish.jpeg', title: S.of(context).Polish),
      ServicesItemModel(
          image: 'assets/images/tyre_wash.jpeg', title: S.of(context).tyreWash),
    ];
    return BlocProvider(
      create: (context) => ServicesItemCubit(initialItems),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).title, style: AppStyles.style30w700),
              // const Text('happy car!', style: AppStyles.style30w700),
              const SizedBox(height: 10),
              SearchServiceWidget(),
              Column(
                  children: List.generate(
                items.length,
                (index) => GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppointmentView()));
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
      ),
    );
  }
}

class SearchServiceWidget extends StatefulWidget {
  const SearchServiceWidget({
    super.key,
  });

  @override
  State<SearchServiceWidget> createState() => _SearchServiceWidgetState();
}

class _SearchServiceWidgetState extends State<SearchServiceWidget> {
  TextEditingController? controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.list, color: Colors.grey),
          hintText: S.of(context).search,
          textInputType: TextInputType.text,
          onChanged: (text) {
            context.read<ServicesItemCubit>().filterServices(text);
          },
        ),
        const SizedBox(height: 10),
        const FeaturedServiceWidget(),
      ],
    );
  }
}
