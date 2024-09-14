import 'dart:developer';

import 'package:carwash/Features/services/data/models/payment_intent_input_model.dart';
import 'package:carwash/Features/services/data/repos/checkout_repo.dart';
import 'package:carwash/core/Utils/stripe_service.dart';
import 'package:carwash/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } on StripeException catch (e) {
      log(e.toString());
      return left(ServerFailure(e.error.message ?? 'Oops there was an error'));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }
}
