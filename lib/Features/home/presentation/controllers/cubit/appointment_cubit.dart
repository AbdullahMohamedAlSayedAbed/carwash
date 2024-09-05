import 'package:bloc/bloc.dart';
import 'package:carwash/Features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this.homeRepo) : super(AppointmentInitial());
  final HomeRepo homeRepo;
  void getAppointment() async {
    emit(AppointmentLoading());
    var result = await homeRepo.getAppointment();
    result.fold(
      (failure) => emit(AppointmentFailure(errMessage: failure.message)),
      (data) => emit(AppointmentSuccess(data: data)),
    );
  }
}
