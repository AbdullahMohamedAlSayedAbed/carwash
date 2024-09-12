import 'package:carwash/Features/login/domain/entities/user_entity.dart';
import 'package:carwash/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> signIn(String email, String password);
  Future<Either<Failure, UserEntity>> signUp(
      String username, String email, String password);
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, UserEntity>> loginWithGmail();
  Future<Either<Failure, UserEntity>> loginWithFacebook();
  Future<Either<Failure, void>> addCarType(String carType);
  Future<Either<Failure, List<Map<String, dynamic>>>> getCars();
}
