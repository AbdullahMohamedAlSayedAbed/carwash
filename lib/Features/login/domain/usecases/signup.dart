import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/core/errors/failure.dart';
import 'package:carwash/Features/login/domain/entities/user_entity.dart';

class SignUpUseCase {
  final UserRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserEntity>> execute(
      String username, String email, String password) async {
    return repository.signUp(username, email, password);
  }
}
