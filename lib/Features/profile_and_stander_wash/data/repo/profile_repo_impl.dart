import 'package:carwash/Features/profile_and_stander_wash/data/models/user_model.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/entities/user_entity.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/repos/profile_repo.dart';
import 'package:carwash/core/services/data_service.dart';

class ProfileRepoImpl  extends ProfileRepo {
  final DatabaseService databaseService;

  ProfileRepoImpl({required this.databaseService});
    Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
        path: 'user', docuementId: uid);
    return UserModel.fromJson(userData);
  }
}