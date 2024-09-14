import 'package:carwash/Features/home/presentation/controllers/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBarBlocBuilder extends StatelessWidget {
  const CustomBottomNavBarBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          mouseCursor: SystemMouseCursors.click,
          currentIndex: state,
          onTap: (newIndex) {
            context.read<BottomNavCubit>().updateIndex(newIndex);
          },
          backgroundColor: AppColors.primaryColor,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: [
            BottomNavigationBarItem(

              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: S.of(context).Home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.local_car_wash_outlined),
              activeIcon: const Icon(Icons.local_car_wash),
              label: S.of(context).Service,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                label: S.of(context).Profile),
          ],
        );
      },
    );
  }
}
