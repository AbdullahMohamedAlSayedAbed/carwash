import 'package:carwash/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, List<AppointmentEntity>>> getAppointment();
}
