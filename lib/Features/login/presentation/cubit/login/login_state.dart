import 'package:equatable/equatable.dart';

// الحالة الأساسية لكل طرق تسجيل الدخول
abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

// الحالة الأولية عند بدء الكيوبت
class SignInInitial extends SignInState {}

// حالة تسجيل الدخول عندما تكون العملية قيد التحميل
class SignInLoading extends SignInState {}

// حالة نجاح تسجيل الدخول باستخدام Google
class SignInWithGoogleSuccess extends SignInState {
  final String message;

  const SignInWithGoogleSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

// حالة نجاح تسجيل الدخول باستخدام Facebook
class SignInWithFacebookSuccess extends SignInState {
  final String message;

  const SignInWithFacebookSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

// حالة نجاح تسجيل الدخول باستخدام Email
class SignInWithEmailSuccess extends SignInState {
  final String message;

  const SignInWithEmailSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class SignInFailure extends SignInState {
  final String errorMessage;

  const SignInFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
