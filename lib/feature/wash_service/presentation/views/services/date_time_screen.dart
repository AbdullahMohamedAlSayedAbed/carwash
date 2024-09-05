// ignore_for_file: must_be_immutable

import 'package:car_wash/core/utilities/app_color.dart';
import 'package:car_wash/feature/wash_service/presentation/views/services/service_screen.dart';
import 'package:car_wash/feature/wash_service/presentation/widgets/custom_calender.dart';
import 'package:car_wash/feature/wash_service/presentation/widgets/custom_column.dart';
import 'package:car_wash/feature/wash_service/presentation/widgets/custom_next_button.dart';
import 'package:car_wash/feature/wash_service/presentation/widgets/custom_time.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class DateTimeScreen extends StatelessWidget {
  DateTimeScreen({super.key, required this.activeStep});
  int activeStep;

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
                color: AppColor.blueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'pick date and time',
              style: TextStyle(
                color: AppColor.greyColor,
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
                  unreachedStepBackgroundColor: AppColor.greyColor,
                  // line
                  lineStyle: LineStyle(
                    lineType: LineType.normal,
                    defaultLineColor: AppColor.greyColor,
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
              const CustomColumn(),

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTime(text: '11:30 AM'),
                  CustomTime(text: '12:30 AM'),
                  CustomTime(text: '14:00 PM'),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: CustomNextButton(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
