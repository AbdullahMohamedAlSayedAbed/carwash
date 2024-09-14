import 'package:carwash/Features/wash_service/presentation/views/services/date_time_screen.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_column.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_map.dart';
import 'package:carwash/Features/wash_service/presentation/widgets/custom_next_button.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DateTimeScreen()));
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
                  activeStep: 1,
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
                text1: 'Select your location',
                text2: 'select where you want to wash your car',
              ),

              // map
              const CustomMap(),
              // SizedBox(
              //   height: 500,
              //   child: GoogleMap(
              //     mapType: MapType.hybrid,
              //     initialCameraPosition: _kGooglePlex,
              //     onMapCreated: (GoogleMapController controller) {
              //       _controller.complete(controller);
              //     },
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CustomNextButton(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
