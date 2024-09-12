import 'package:carwash/Features/services/data/repos/checkout_repo_impl.dart';
import 'package:carwash/Features/services/presentation/manger/cubit/payment_cubit.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_payment_bloc_consummer.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_payment_method.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_process_app_bar.dart';
import 'package:carwash/Features/services/presentation/widgets/custom_stepper.dart';
import 'package:carwash/core/Utils/app_strings.dart';
import 'package:carwash/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int? itemIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProcessAppBar(
                title: 'Payment method',
              ),
              const CustomStepper(
                activeStepper: 2,
              ),
              const Text('Select your payment method',
                  style: AppStyles.style24w700),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            itemIndex = index;
                          });
                          print(itemIndex);
                        },
                        child: CustomPaymentMethodWidget(
                          image: AppStrings.paymentList[index].image,
                          title: AppStrings.paymentList[index].name,
                          selected: itemIndex == index,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              BlocProvider(
                create: (context) => PaymentCubit(CheckoutRepoImpl()),
                child: CustomButtonBlocConsumer(index: itemIndex ?? 0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
