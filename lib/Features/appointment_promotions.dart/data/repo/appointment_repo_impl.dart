import 'package:carwash/Features/appointment_promotions.dart/data/data_sources/appointment_local_data_source.dart';
import 'package:carwash/Features/appointment_promotions.dart/data/data_sources/appointment_remote_data_source.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/repos/appointment_repo.dart';
import 'package:carwash/core/error/failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final AppointmentRemoteDataSource remoteDataSource;
  final AppointmentLocalDataSource localDataSource;

  AppointmentRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getAppointment() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      List<AppointmentEntity> appointments;
      if (connectivityResult == ConnectivityResult.none) {
        appointments = localDataSource.fetchAppointment();
        if (appointments.isNotEmpty) {
          return Right(appointments);
        }
        return Left(ServerFailure("No internet connection"));
      }
      appointments = await remoteDataSource.getAppointment();
      return Right(appointments);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
