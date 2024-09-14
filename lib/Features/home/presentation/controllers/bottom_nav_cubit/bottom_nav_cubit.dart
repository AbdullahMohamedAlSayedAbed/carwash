
import 'package:carwash/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/views/profile_view.dart';
import 'package:carwash/Features/services/presentation/views/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
  
  void updateIndex(int newIndex) {
    emit(newIndex);
  }
  final  List<Widget> screens = [
    const HomeViewBody(),
    const ServicesScreen(),
    const ProfileView(),
  ];
  
}