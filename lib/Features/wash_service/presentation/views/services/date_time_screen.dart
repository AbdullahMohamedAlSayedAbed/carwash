// ignore_for_file: must_be_immutable

// import 'package:car_wash/feature/wash_service/presentation/widgets/custom_next_button.dart';
import 'package:carwash/Features/wash_service/presentation/views/services/service_screen.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_calender.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_column.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_time.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class DateTimeScreen extends StatelessWidget {
  const DateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicesScreen()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Center(
            child: Column(
          children: [
            Text(
              'Standard Wash',
              style: TextStyle(
                color: AppColors.blueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'pick date and time',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
          ],
        )),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
          child: Column(
            children: [
              // divider
              const Divider(),
              // stepper
              const SizedBox(
                height: 75,
                width: double.infinity,
                child: EasyStepper(
                  activeStep: 0,
                  stepRadius: 18,
                  defaultStepBorderType: BorderType.normal,
                  showLoadingAnimation: false,
                  activeStepBackgroundColor: Colors.orange,
                  unreachedStepBackgroundColor: AppColors.greyColor,
                  // line
                  lineStyle: LineStyle(
                    lineType: LineType.normal,
                    defaultLineColor: AppColors.greyColor,
                  ),
                  steps: [
                    EasyStep(customStep: Text('1', style: TextStyle(color: Colors.white))),
                    EasyStep(customStep: Text('2', style: TextStyle(color: Colors.white))),
                    EasyStep(customStep: Text('3', style: TextStyle(color: Colors.white))),
                    EasyStep(customStep: Text('4', style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
              //column
              CustomColumn(
                text1: 'Select your date and time',
                text2: 'Select days when wash is available',
              ),

              // calender
              const CustomCalender(),

              const Row(
                children: [
                  Text(
                    'Time',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // cusotm time
              const CustomTime(),

              //   Padding(
              //     padding: const EdgeInsets.only(top: 25),
              //     child: CustomNextButton(
              //       onTap: () {},
              //       validator: (p0) {
              //         return null;
              //       },
              //     ),
              //   ),
            ],
          ),
        ),
      ]),
    );
  }
}
