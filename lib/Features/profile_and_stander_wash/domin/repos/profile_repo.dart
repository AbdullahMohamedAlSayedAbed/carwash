import 'package:carwash/Features/profile_and_stander_wash/domin/entities/user_entity.dart';

abstract class ProfileRepo {
     Future<UserEntity> getUserData({required String uid});
}