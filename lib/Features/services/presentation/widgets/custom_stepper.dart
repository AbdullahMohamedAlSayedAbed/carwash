import 'package:carwash/core/Utils/app_color.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
    required this.activeStepper,
  });
  final int activeStepper;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: double.infinity,
      child: EasyStepper(
        activeStep: activeStepper,
        finishedStepBorderColor: AppColors.orange,
        finishedStepBackgroundColor: AppColors.orange,

        stepRadius: 18,
        defaultStepBorderType: BorderType.normal,
        showLoadingAnimation: false,
        activeStepBackgroundColor: Colors.orange,
        unreachedStepBackgroundColor: AppColors.grey,
        // line
        lineStyle: const LineStyle(
          lineType: LineType.normal,
          defaultLineColor: AppColors.grey,
        ),
        steps: const [
          EasyStep(
              customStep: Text('1', style: TextStyle(color: Colors.white))),
          EasyStep(
              customStep: Text('2', style: TextStyle(color: Colors.white))),
          EasyStep(
              customStep: Text('3', style: TextStyle(color: Colors.white))),
          EasyStep(
              customStep: Text('4', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
