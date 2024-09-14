import 'package:bloc/bloc.dart';
import 'package:carwash/Features/login/presentation/cubit/login/reset_password/resetpassword_state.dart';
import 'package:carwash/Features/login/data/reposotries/user_repository_impl.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final UserRepositoryImpl _userRepository;

  ResetPasswordCubit(this._userRepository) : super(ResetPasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    final result = await _userRepository.resetPassword(email);
    result.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }
}
