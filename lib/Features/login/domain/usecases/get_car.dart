import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:carwash/core/error/failures.dart';

import 'package:dartz/dartz.dart';

class GetCarsUseCase {
  final UserRepository repository;

  GetCarsUseCase(this.repository);

  Future<Either<Failure, List<Map<String, dynamic>>>> execute() async {
    return repository.getCars();
  }
}
