import 'package:equatable/equatable.dart';

abstract class GetCarsState extends Equatable {
  const GetCarsState();

  @override
  List<Object> get props => [];
}

// حالة التحميل
class GetCarsLoading extends GetCarsState {}

class GetCarsSuccess extends GetCarsState {
  final List<Map<String, dynamic>> cars;

  const GetCarsSuccess(this.cars);

  @override
  List<Object> get props => [cars];
}

class GetCarsFailure extends GetCarsState {
  final String error;

  const GetCarsFailure(this.error);

  @override
  List<Object> get props => [error];
}
