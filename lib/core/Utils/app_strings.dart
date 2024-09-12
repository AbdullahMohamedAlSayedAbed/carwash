import 'package:carwash/Features/services/data/models/paymrnt_model.dart';
import 'package:carwash/core/Utils/app_images.dart';

class AppStrings {
  static List<PaymentModel> paymentList = [
    PaymentModel(name: 'Cash', image: AppImages.cashImage),
    PaymentModel(name: 'Credit Card', image: AppImages.cardImage),
    PaymentModel(name: 'Paypal', image: AppImages.paypalImage),
    PaymentModel(name: 'Apple Pay', image: AppImages.appleImage),
  ];
}
