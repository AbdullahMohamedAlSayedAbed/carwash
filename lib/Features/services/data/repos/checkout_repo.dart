import 'package:carwash/Features/services/data/models/payment_intent_input_model.dart';
import 'package:carwash/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
