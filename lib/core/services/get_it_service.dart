import 'package:carwash/Features/appointment_promotions.dart/data/data_sources/appointment_local_data_source.dart';
import 'package:carwash/Features/appointment_promotions.dart/data/data_sources/appointment_remote_data_source.dart';
import 'package:carwash/Features/appointment_promotions.dart/data/repo/appointment_repo_impl.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/repo/profile_repo_impl.dart';
import 'package:carwash/core/services/data_service.dart';
import 'package:carwash/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<AppointmentRepoImpl>(
    AppointmentRepoImpl(
      remoteDataSource:
          AppointmentRemoteDataSource(firestore: FireStoreService()),
      localDataSource: AppointmentLocalDataSourceImpl(),
    ),
  );
}

