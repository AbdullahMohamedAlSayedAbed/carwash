import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/core/errors/failure.dart';
import 'package:carwash/Features/login/domain/entities/user_entity.dart';

class LoginWithFacebookUseCase {
  final UserRepository repository;

  LoginWithFacebookUseCase(this.repository);

  Future<Either<Failure, UserEntity>> execute() async {
    return repository.loginWithFacebook();
  }
}
