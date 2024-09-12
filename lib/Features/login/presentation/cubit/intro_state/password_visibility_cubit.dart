import 'package:flutter_bloc/flutter_bloc.dart';
import 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit()
      : super(PasswordVisibilityState(isPasswordHidden: true));

  void toggleVisibility() {
    emit(PasswordVisibilityState(isPasswordHidden: !state.isPasswordHidden));
  }
}
