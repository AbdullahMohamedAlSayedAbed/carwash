import 'package:carwash/Features/home/presentation/views/home_view.dart';
import 'package:carwash/Features/login/presentation/widgets/blububle.dart';
import 'package:carwash/Features/login/presentation/widgets/button_weidget.dart';
import 'package:carwash/Features/login/presentation/widgets/small_text_weidget.dart';
import 'package:carwash/Features/login/presentation/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carwash/Features/login/presentation/widgets/car_weidget.dart';
import 'package:carwash/Features/login/presentation/cubit/getcars/getcars_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/getcars/getcars_state.dart';
import 'package:carwash/Features/login/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/sign_up/sign_up_state.dart';

class CarType extends StatefulWidget {
  const CarType({super.key});

  @override
  _CarTypeState createState() => _CarTypeState();
}

class _CarTypeState extends State<CarType> {
  String? selectedCar;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetCarsCubit>().fetchCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.2,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            "Before We Start",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.03,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 0,
                    child: Blububle(size: 50),
                  ),
                  const Positioned(
                    top: 10,
                    left: 2,
                    child: Blububle(size: 50),
                  ),
                  const Positioned(
                    top: 100,
                    right: 0,
                    child: Blububle(size: 50),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      title: "Select your car type so we can",
                      color: Theme.of(context).primaryColor,
                      size: screenHeight * 0.025,
                    ),
                    TextWidget(
                      title: "adjust our prices for you!",
                      color: Theme.of(context).primaryColor,
                      size: screenHeight * 0.025,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SmallTextWeidget(
                      title: "Car Type:",
                      color: Colors.grey,
                      size: screenHeight * 0.02,
                    ),
                    Expanded(
                      child: BlocBuilder<GetCarsCubit, GetCarsState>(
                        builder: (context, state) {
                          if (state is GetCarsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is GetCarsFailure) {
                            return Center(
                              child:
                                  Text("Failed to load cars: ${state.error}"),
                            );
                          } else if (state is GetCarsSuccess) {
                            final cars = state.cars;
                            if (cars.isEmpty) {
                              return const Center(
                                child: Text("No cars available"),
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: cars.length,
                              itemBuilder: (context, index) {
                                final car = cars[index];
                                return CarItemWidget(
                                  carName: car['name'],
                                  carImage: car['image'],
                                  selectedCar: selectedCar,
                                  onSelect: () {
                                    setState(() {
                                      selectedCar = car['name'];
                                    });
                                  },
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: Text("Unexpected error"),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    BlocListener<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        } else if (state is SignUpFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)),
                          );
                        }
                      },
                      child: ButtonWeidget(
                        onPressed: () {
                          if (selectedCar != null) {
                            context
                                .read<SignUpCubit>()
                                .addCarType(selectedCar!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please select a car type")),
                            );
                          }
                        },
                        text: "Save",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
