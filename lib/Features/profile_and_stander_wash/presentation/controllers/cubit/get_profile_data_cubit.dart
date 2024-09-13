import 'package:bloc/bloc.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/models/user_model.dart';
import 'package:carwash/Features/profile_and_stander_wash/data/repo/profile_repo_impl.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/entities/user_entity.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/repos/profile_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  GetProfileDataCubit(this.profileRepo) : super(GetProfileDataInitial());
  final ProfileRepoImpl profileRepo;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');
    emit(GetProfileDataLoading());
    try {
      // var userDatafromFirestore = _firestore.collection('user').doc(uid).get();
      final UserEntity userData = await profileRepo.getUserData(uid: uid!);
      emit(GetProfileDataSuccess(userEntity: userData));
    } catch (e) {
      emit(GetProfileDataFailure(e.toString()));
    }
  }
}
