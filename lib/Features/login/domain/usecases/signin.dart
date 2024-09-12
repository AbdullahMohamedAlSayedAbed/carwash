import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:carwash/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import 'package:carwash/Features/login/domain/entities/user_entity.dart';

class SignInUseCase {
  final UserRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, UserEntity>> execute(
      String email, String password) async {
    return repository.signIn(email, password);
  }
}
