import 'package:bloc/bloc.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/entities/user_entity.dart';
import 'package:carwash/Features/profile_and_stander_wash/domin/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  GetProfileDataCubit(this.profileRepo) : super(GetProfileDataInitial());
  final ProfileRepo profileRepo;
  Future<void> getProfileData() async {
    emit(GetProfileDataLoading());
    try {
    final UserEntity   userData =
          await profileRepo.getUserData(uid: 'AtdailTiRuXo7XGC09XB');
      emit(GetProfileDataSuccess(userEntity: userData));
    } catch (e) {
      emit(GetProfileDataFailure(e.toString()));
    }
  }
}
