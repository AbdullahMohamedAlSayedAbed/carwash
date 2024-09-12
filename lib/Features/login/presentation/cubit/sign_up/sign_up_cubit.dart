import 'package:bloc/bloc.dart';
import 'sign_up_state.dart';
import 'package:carwash/Features/login/domain/repositry/user_repository.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final UserRepository _userRepository;

  SignUpCubit(this._userRepository) : super(SignUpInitial());

  Future<void> signUp(
      {required String email,
      required String password,
      required String username}) async {
    emit(SignUpLoading());
    try {
      final result = await _userRepository.signUp(username, email, password);
      result.fold(
        (failure) =>
            emit(SignUpFailure('Failed to sign up: ${failure.errMessage}')),
        (user) => emit(SignUpSuccess()),
      );
    } catch (e) {
      emit(SignUpFailure('Failed to sign up: $e'));
    }
  }

  Future<void> addCarType(String carType) async {
    emit(SignUpLoading());
    try {
      final result = await _userRepository.addCarType(carType);
      result.fold(
        (failure) => emit(
            SignUpFailure('Failed to add car type: ${failure.errMessage}')),
        (_) => emit(SignUpSuccess()),
      );
    } catch (e) {
      emit(SignUpFailure('Failed to add car type: $e'));
    }
  }
}
