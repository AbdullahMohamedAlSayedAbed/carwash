import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/core/errors/failure.dart';

class ResetPasswordUseCase {
  final UserRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, void>> execute(String email) async {
    return repository.resetPassword(email);
  }
}
