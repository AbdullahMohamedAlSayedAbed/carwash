import 'package:carwash/Features/login/data/datasource/firebase_datasource.dart';
import 'package:carwash/Features/login/domain/entities/user_entity.dart';
import 'package:carwash/Features/login/domain/repositry/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseDataSource firebaseDataSource;

  UserRepositoryImpl({required this.firebaseDataSource});

  @override
  Future<Either<Failure, UserEntity>> signUp(
      String username, String email, String password) async {
    try {
      await firebaseDataSource.signUp(email, password, username);
      UserEntity newUser =
          UserEntity(username: username, email: email, password: password);
      return Right(newUser);
    } catch (e) {
      return Left(Failure(errMessage: 'Signup failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> addCarType(String carType) async {
    try {
      await firebaseDataSource.addCarType(carType);
      return Right(unit);
    } catch (e) {
      return Left(
          Failure(errMessage: 'Failed to add car type: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getCars() async {
    try {
      final cars = await firebaseDataSource.getCars();
      return Right(cars);
    } catch (e) {
      return Left(
          Failure(errMessage: 'Failed to get car type: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      User? user = await firebaseDataSource.loginWithFacebook();

      if (user != null) {
        UserEntity userEntity = UserEntity(
          username: user.displayName ?? "Unknown",
          email: user.email ?? "",
          password: "",
        );
        return Right(userEntity);
      } else {
        return Left(Failure(errMessage: 'Failed to sign in with Facebook'));
      }
    } catch (e) {
      return Left(Failure(errMessage: 'Failed to sign in with Facebook: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGmail() async {
    try {
      User? user = await firebaseDataSource.loginWithGmail();

      if (user != null) {
        UserEntity userEntity = UserEntity(
          username: user.displayName ?? "Unknown",
          email: user.email ?? "",
          password: "",
        );
        return Right(userEntity);
      } else {
        return Left(Failure(errMessage: 'Failed to sign in with Google'));
      }
    } catch (e) {
      return Left(Failure(errMessage: 'Failed to sign in with Google: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await firebaseDataSource.resetPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(Failure(errMessage: 'Failed to send reset password email.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
      String email, String password) async {
    String errorMessage = 'Error In PassWord Or Gmail ! Try Again';
    try {
      User? user =
          await firebaseDataSource.signInWithEmailAndPassword(email, password);

      if (user != null) {
        UserEntity userEntity = UserEntity(
          username: user.displayName ?? "Unknown",
          email: user.email ?? "",
          password: password,
        );
        print("Sign-in successful");
        return Right(userEntity);
      } else {
        return Left(Failure(errMessage: errorMessage));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password, please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        default:
          errorMessage = 'Login failed. Please try again later.';
      }
      print("Error message set to: $errorMessage");
      return Left(Failure(errMessage: errorMessage));
    } catch (e) {
      return Left(Failure(errMessage: errorMessage));
    }
  }

  Future<Either<Failure, bool>> checkIfCarTypeExists(String uid) async {
    try {
      final result = await firebaseDataSource.checkIfCarTypeExists(uid);
      return Right(result);
    } catch (e) {
      return Left(Failure(errMessage: 'Failed to check car type: $e'));
    }
  }
}
