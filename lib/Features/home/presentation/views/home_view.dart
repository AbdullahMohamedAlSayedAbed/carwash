import 'package:carwash/Features/home/presentation/controllers/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:carwash/Features/home/presentation/views/widgets/custom_notifications_icon_button.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/repo/profile_repo_impl.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/cubit/get_profile_data_cubit.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/services/firestore_service.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetProfileDataCubit(
                ProfileRepoImpl(databaseService: FireStoreService()))
              ..getProfileData(),
          ),
          BlocProvider(create: (context) => BottomNavCubit()),
        ],
        child: Builder(
            builder: (context) => Scaffold(
                  body: BlocBuilder<BottomNavCubit, int>(
                    builder: (context, state) {
                      return IndexedStack(
                          index: state,
                          children: context.read<BottomNavCubit>().screens);
                    },
                  ),
                  bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
                    builder: (context, state) {
                      return BottomNavigationBar(
                        currentIndex: state,
                        onTap: (newIndex) {
                          context.read<BottomNavCubit>().updateIndex(newIndex);
                        },
                        backgroundColor: AppColors.primaryColor,
                        showUnselectedLabels: true,
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.grey,
                        selectedIconTheme:
                            const IconThemeData(color: Colors.white),
                        unselectedIconTheme:
                            IconThemeData(color: Colors.grey),
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
                  ),
                )));
  }
}
    
//     BlocProvider(
//       create: (context) => GetProfileDataCubit(
//           ProfileRepoImpl(databaseService: FireStoreService()))
//         ..getProfileData(),
//       child: 
//       }),
//     );
//   }
// }
