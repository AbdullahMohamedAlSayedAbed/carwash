abstract class LoginValidationState {}

class ValidationInitial extends LoginValidationState {}

class ValidationSuccess extends LoginValidationState {}

class ValidationFailure extends LoginValidationState {
  final String errorMessage;

  ValidationFailure(this.errorMessage);
}
