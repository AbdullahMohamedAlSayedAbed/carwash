import 'dart:developer';

import 'package:carwash/Features/services/data/models/amount_model/amount_model.dart';
import 'package:carwash/Features/services/data/models/item_list_model/item_list_model.dart';
import 'package:carwash/Features/services/data/models/payment_intent_input_model.dart';
import 'package:carwash/Features/services/presentation/manger/cubit/payment_cubit.dart';
import 'package:carwash/Features/services/presentation/views/information_screen.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_material_button.dart';
import 'package:carwash/core/Utils/api_keys.dart';
import 'package:carwash/core/Utils/app_images.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/core/funftions/get_transction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const InformationScreen();
          }));
        }

        if (state is PaymentFailure) {
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomMaterialButton(
            onPressed: () {
              switch (index) {
                case 0:
                  executeCashPayment(context);
                  break;
                case 1:
                  excuteStripePayment(context);
                  break;
                case 2:
                  var data = getTransctionsData();
                  exceutePaypalPayment(context, data);

                  break;
                case 3:
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const InformationScreen();
                    }),
                    (route) {
                      return false;
                    },
                  );

                  break;
                default:
              }
              // if (isPaypal) {
              //   var transctionsData = getTransctionsData();
              //   exceutePaypalPayment(context, transctionsData);
              // } else {
              //   excuteStripePayment(context);
              // }
            },
            isLoading: state is PaymentLoading ? true : false,
            label: 'Continue');
      },
    );
  }

  Future<dynamic> executeCashPayment(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppImages.cashImage,
                  height: 200,
                ),
                const Text(
                  'You will pay Cash on delivery',
                  style: AppStyles.style30w700,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomMaterialButton(
                      color: Colors.green,
                      label: 'Accepted',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InformationScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomMaterialButton(
                      label: 'rejected',
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
    );
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const InformationScreen();
            }),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const InformationScreen();
            }),
            (route) {
              return false;
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
}
