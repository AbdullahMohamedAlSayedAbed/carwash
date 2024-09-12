import 'package:carwash/Features/home/presentation/views/home_view.dart';
import 'package:carwash/Features/services/presentation/views/service_screen.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../profile_and_stander_wash/presentation/views/profile_view.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(context),
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
    const ServicesScreen(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home, color: Colors.white),
        inactiveIcon: const Icon(Icons.home_outlined, color: Colors.white),
        title: S.of(context).Home,
        textStyle: AppStyles.style14White,
        activeColorPrimary: Colors.white),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_car_wash, color: Colors.white),
        inactiveIcon:
            const Icon(Icons.local_car_wash_outlined, color: Colors.white),
        title: S.of(context).Service,
        textStyle: AppStyles.style14White,
        activeColorPrimary: Colors.white),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, color: Colors.white),
        inactiveIcon: const Icon(Icons.person_outline, color: Colors.white),
        title: S.of(context).Profile,
        textStyle: AppStyles.style14White,
        activeColorPrimary: Colors.white),
  ];
}
