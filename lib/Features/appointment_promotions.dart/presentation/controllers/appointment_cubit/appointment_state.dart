part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}
final class AppointmentLoading extends AppointmentState {}
final class AppointmentFailure extends AppointmentState {
  final String errMessage;

  AppointmentFailure(this.errMessage);
}
final class AppointmentSuccess extends AppointmentState {
  final List<AppointmentEntity> data;

  AppointmentSuccess({required this.data});
}
