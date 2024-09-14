part of 'payment_detailes_cubit.dart';

sealed class PaymentDetailsState extends Equatable {
  const PaymentDetailsState();

  @override
  List<Object> get props => [];
}

final class PaymentDetailsInitial extends PaymentDetailsState {}

class PaymentMethodSelected extends PaymentDetailsState {
  final String cardName;
  final String price;

  PaymentMethodSelected({required this.cardName, required this.price});
}

class PaymentProcessing extends PaymentDetailsState {}

class PaymentDetailsSuccess extends PaymentDetailsState {}

class PaymentDetailsFailure extends PaymentDetailsState {
  final String errMessage;

  PaymentDetailsFailure(this.errMessage);
}
