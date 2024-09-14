import 'package:bloc/bloc.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/repo/profile_repo_impl.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  GetProfileDataCubit(this.profileRepo) : super(GetProfileDataInitial());
  final ProfileRepoImpl profileRepo;
  Future<void> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');
    if (uid == null) {
      User? user;
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        uid = user.uid;
        prefs.setString('uid', uid);
      }
    }
    emit(GetProfileDataLoading());
    try {
      final UserEntity userData = await profileRepo.getUserData(uid: uid!);
      emit(GetProfileDataSuccess(userEntity: userData));
    } catch (e) {
      emit(GetProfileDataFailure(e.toString()));
    }
  }
}
