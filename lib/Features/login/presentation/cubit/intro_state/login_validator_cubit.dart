import 'package:flutter_bloc/flutter_bloc.dart';

class LoginValidationCubit extends Cubit<LoginValidationState> {
  LoginValidationCubit() : super(LoginValidationState());

  void validateEmail(String email) {
    if (email.isEmpty) {
      emit(state.copyWith(emailError: 'Email is required'));
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      emit(state.copyWith(emailError: 'Invalid email'));
    } else {
      emit(state.copyWith(emailError: ''));
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(state.copyWith(passwordError: 'Password is required'));
    } else if (password.length < 6) {
      emit(state.copyWith(
          passwordError: 'Password must be at least 6 characters'));
    } else {
      emit(state.copyWith(passwordError: ''));
    }
  }

  // تحقق من اسم المستخدم
  void validateUsername(String username) {
    if (username.isEmpty) {
      emit(state.copyWith(usernameError: 'Username is required'));
    } else if (username.length < 3) {
      emit(state.copyWith(
          usernameError: 'Username must be at least 3 characters'));
    } else {
      emit(state.copyWith(usernameError: ''));
    }
  }
}

class LoginValidationState {
  final String emailError;
  final String passwordError;
  final String usernameError;

  LoginValidationState({
    this.emailError = '',
    this.passwordError = '',
    this.usernameError = '',
  });

  LoginValidationState copyWith({
    String? emailError,
    String? passwordError,
    String? usernameError,
  }) {
    return LoginValidationState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      usernameError: usernameError ?? this.usernameError,
    );
  }
}
