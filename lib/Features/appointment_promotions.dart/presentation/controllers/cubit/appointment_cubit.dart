import 'package:bloc/bloc.dart';
import 'package:carwash/Features/appointment_promotions.dart/data/repo/appointment_repo_impl.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:meta/meta.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this.appointmentRepoImpl) : super(AppointmentInitial());
  final AppointmentRepoImpl appointmentRepoImpl;
  void getAppointment() async{
    emit(AppointmentLoading());
    var result =await appointmentRepoImpl.getAppointment();
    result.fold(
      (failure) => emit(AppointmentFailure(failure.message)),
      (data) => emit(AppointmentSuccess(data: data)),
    );
  }
}
