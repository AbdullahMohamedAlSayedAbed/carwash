import 'package:carwash/Features/profile_and_stander_wash/data/repo/profile_repo_impl.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/repos/profile_repo.dart';
import 'package:carwash/core/services/data_service.dart';
import 'package:carwash/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ProfileRepo>(
      ProfileRepoImpl(databaseService: getIt<DatabaseService>()),
      );
}
