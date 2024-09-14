import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_detailes_state.dart';

class PaymentDetailsCubit extends Cubit<PaymentDetailsState> {
  PaymentDetailsCubit() : super(PaymentDetailsInitial());
  String selectedCardName = '';
  String price = '';

  void selectPaymentMethod(int index, String cardName, String price) {
    selectedCardName = cardName;
    this.price = price;
    emit(PaymentMethodSelected(cardName: cardName, price: price));
  }

}
