import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:carwash/core/error/failures.dart';
import 'package:dartz/dartz.dart';


class ResetPasswordUseCase {
  final UserRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, void>> execute(String email) async {
    return repository.resetPassword(email);
  }
}
