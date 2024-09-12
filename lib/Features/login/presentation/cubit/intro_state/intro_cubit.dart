import 'package:carwash/core/databases/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());

  void completeIntro() async {
    await CacheHelper.setIntroShown();
    emit(IntroCompleted());
  }
}
