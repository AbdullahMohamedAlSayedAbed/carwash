import 'package:carwash/Features/home/presentation/views/about_us_view.dart';
import 'package:carwash/Features/home/presentation/views/home_view.dart';
import 'package:carwash/Features/home/presentation/views/widgets/home_nav_bar_widget.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/standard_wash_view.dart';
import 'package:carwash/Features/services/presentation/views/services_view.dart';
import 'package:flutter/material.dart';

import '../../Features/profile_and_stander_wash/presentation/views/profile_view.dart';

abstract class AppRoute {
  static const home = 'home';
  static const homeNavBar = 'HomeNavBar';
  static const profile = 'profile';
  static const aboutUs = 'aboutUs';
  static const service = 'service';
  static const standardWash = 'standardWash';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeNavBar:
        return MaterialPageRoute(
            builder: (context) => const HomeNavBarWidget());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case aboutUs:
        return MaterialPageRoute(builder: (context) => const AboutUsView());

      case profile:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case standardWash:
        return MaterialPageRoute(builder: (context) => const StandardWashView());

      case service:
        return MaterialPageRoute(builder: (context) => const ServicesView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
