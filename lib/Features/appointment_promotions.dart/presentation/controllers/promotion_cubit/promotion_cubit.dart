import 'package:bloc/bloc.dart';
import 'package:carwash/Features/appointment_promotions.dart/data/repo/appointment_repo_impl.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/promotions_entity.dart';
import 'package:meta/meta.dart';

part 'promotion_state.dart';

class PromotionCubit extends Cubit<PromotionState> {
  PromotionCubit(this.appointmentRepoImpl) : super(PromotionInitial());
  final AppointmentAndPromotionRepoImpl appointmentRepoImpl;

  void getPromotion() async {
    emit(PromotionLoading());
    var result = await appointmentRepoImpl.getPromotion();
    result.fold(
      (failure) => emit(PromotionFailure(failure.message)),
      (data) => emit(PromotionSuccess(data: data)),
    );
  }
}
