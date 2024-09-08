import 'package:carwash/Features/appointment_promotions.dart/data/data_sources/appointment_local_data_source.dart';
import 'package:carwash/Features/appointment_promotions.dart/data/data_sources/appointment_remote_data_source.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/promotions_entity.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/repos/appointment_repo.dart';
import 'package:carwash/core/error/failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';

class AppointmentAndPromotionRepoImpl implements AppointmentAndPromotionRepo {
  final AppointmentRemoteDataSource remoteDataSource;
  final AppointmentLocalDataSource localDataSource;

  AppointmentAndPromotionRepoImpl({
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

  @override
  Future<Either<Failure, List<PromotionsEntity>>> getPromotion() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      List<PromotionsEntity> promotions;
      if (connectivityResult == ConnectivityResult.none) {
        promotions = localDataSource.fetchPromotions();
        if (promotions.isNotEmpty) {
          return Right(promotions);
        }
        return Left(ServerFailure("No internet connection"));
      }
      promotions = await remoteDataSource.getPromotion();
      return Right(promotions);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
