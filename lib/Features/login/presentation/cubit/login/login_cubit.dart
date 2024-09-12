import 'package:bloc/bloc.dart';
import 'package:carwash/Features/login/data/reposotries/user_repository_impl.dart';
import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:carwash/Features/login/presentation/cubit/login/login_state.dart';
import 'package:carwash/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/Features/login/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInCubit extends Cubit<SignInState> {
  final UserRepositoryImpl _userRepository;

  SignInCubit(this._userRepository) : super(SignInInitial());

  Future<void> signInWithEmail(String email, String password) async {
    emit(SignInLoading());
    final result = await _userRepository.signIn(email, password);
    result.fold(
      (failure) {
        emit(SignInFailure(failure.errMessage));
      },
      (user) {
        if (user.carType == null || user.carType!.isEmpty) {
          emit(SignInWithEmailSuccess("Needs car type"));
        } else {
          emit(SignInWithEmailSuccess("Success"));
        }
      },
    );
  }

  Future<void> signInWithGmail() async {
    emit(SignInLoading());

    final result = await _userRepository.loginWithGmail();
    result.fold(
      (failure) => emit(SignInFailure(failure.errMessage)),
      (user) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? uid = prefs.getString('uid');

        if (uid != null) {
          final carTypeExistsResult =
              await _userRepository.checkIfCarTypeExists(uid);
          carTypeExistsResult.fold(
            (failure) => emit(SignInFailure(failure.errMessage)),
            (carTypeExists) {
              if (carTypeExists) {
                emit(SignInWithGoogleSuccess("Login Success"));
              } else {
                emit(SignInWithGoogleSuccess("Needs car type"));
              }
            },
          );
        } else {
          emit(SignInFailure("UID not found in SharedPreferences"));
        }
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());

    final result = await _userRepository.loginWithFacebook();
    result.fold(
      (failure) => emit(SignInFailure(failure.errMessage)),
      (user) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? uid = prefs.getString('uid');

        if (uid != null) {
          final carTypeExistsResult =
              await _userRepository.checkIfCarTypeExists(uid);
          carTypeExistsResult.fold(
            (failure) => emit(SignInFailure(failure.errMessage)),
            (carTypeExists) {
              if (carTypeExists) {
                emit(SignInWithFacebookSuccess("Login Success"));
              } else {
                emit(SignInWithFacebookSuccess("Needs car type"));
              }
            },
          );
        } else {
          emit(SignInFailure("UID not found in SharedPreferences"));
        }
      },
    );
  }

  void _handleSignInResult(
      Either<Failure, UserEntity> result, String loginMethod) {
    result.fold(
      (failure) => emit(SignInFailure(failure.errMessage)),
      (user) {
        if (loginMethod == 'email') {
          emit(SignInWithEmailSuccess("Login Success"));
        }
      },
    );
  }
}
