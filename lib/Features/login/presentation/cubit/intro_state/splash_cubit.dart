import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carwash/core/databases/cache/cache_helper.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void checkAppState() async {
    bool isIntroShown = await CacheHelper.isIntroShown() ?? false;

    if (!isIntroShown) {
      emit(SplashIntro());
    } else {
      emit(SplashLogin());
    }
  }
}
