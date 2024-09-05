import 'package:carwash/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Map<String, dynamic>>>> getAppointment();
}



