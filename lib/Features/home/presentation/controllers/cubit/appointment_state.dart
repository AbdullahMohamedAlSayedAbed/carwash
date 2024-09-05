part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}
final class AppointmentLoading extends AppointmentState {}
final class AppointmentSuccess extends AppointmentState {
  final List<Map<String, dynamic>> data;
  AppointmentSuccess({required this.data});
}
final class AppointmentFailure extends AppointmentState {
  final String errMessage;
  AppointmentFailure({required this.errMessage});
}
