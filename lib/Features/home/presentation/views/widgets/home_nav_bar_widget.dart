import 'package:carwash/Features/home/presentation/views/about_us_view.dart';
import 'package:carwash/Features/home/presentation/views/home_view.dart';
import 'package:carwash/Features/profile/presentation/views/profile_view.dart';
import 'package:carwash/Features/services/presentation/views/services_view.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style6,
      backgroundColor: AppColors.primaryColor,
      navBarHeight: 50,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const ServicesView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home, color: Colors.white),
        inactiveIcon: const Icon(Icons.home_outlined, color: Colors.white),
        title: 'Home',
        textStyle: AppStyles.style14White,
        activeColorPrimary: Colors.white),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_car_wash, color: Colors.white),
        inactiveIcon:
            const Icon(Icons.local_car_wash_outlined, color: Colors.white),
        title: 'Services',
        textStyle: AppStyles.style14White,
        activeColorPrimary: Colors.white),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, color: Colors.white),
        inactiveIcon: const Icon(Icons.person_outline, color: Colors.white),
        title: 'Profile',
        textStyle: AppStyles.style14White,
        activeColorPrimary: Colors.white),
  ];
}
