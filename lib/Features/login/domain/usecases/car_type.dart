import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/core/errors/failure.dart';

class AddCarTypeUseCase {
  final UserRepository repository;

  AddCarTypeUseCase(this.repository);

  Future<Either<Failure, void>> execute(String carType) async {
    return repository.addCarType(carType);
  }
}
