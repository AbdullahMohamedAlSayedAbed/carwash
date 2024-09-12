import 'package:carwash/Features/login/presentation/cubit/intro_state/intro_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/intro_state.dart';
import 'package:carwash/Features/login/presentation/screens/login.dart';
import 'package:carwash/Features/login/presentation/widgets/blububle.dart';
import 'package:carwash/Features/login/presentation/widgets/button_weidget.dart';
import 'package:carwash/Features/login/presentation/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => IntroCubit(),
      child: BlocConsumer<IntroCubit, IntroState>(
        listener: (context, state) {
          if (state is IntroCompleted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).primaryColor,
                child: Stack(
                  children: [
                    const Positioned(
                      top: 3,
                      left: 2,
                      child: Blububle(size: 50),
                    ),
                    const Positioned(
                      top: 2,
                      right: -1,
                      child: Blububle(size: 70),
                    ),
                    const Positioned(
                      top: 30,
                      right: 8,
                      child: Blububle(size: 50),
                    ),
                    const Positioned(
                      top: 25,
                      right: 2,
                      child: Blububle(size: 35),
                    ),
                    const Positioned(
                      bottom: 90,
                      right: 2,
                      child: Blububle(size: 40),
                    ),
                    const Positioned(
                      bottom: 90,
                      left: 0,
                      child: Blububle(size: 60),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(
                              flex: 4,
                            ),
                            const TextWidget(
                              title: "Experience the",
                            ),
                            const TextWidget(
                              title: "Ultimate Car",
                              color: Colors.orange,
                            ),
                            const TextWidget(
                              title: "Wash",
                              color: Colors.orange,
                            ),
                            Center(
                              child: Image.asset(
                                'images/carwash3.png',
                              ),
                            ),
                            const Spacer(
                              flex: 7,
                            ),
                            ButtonWeidget(
                              text: "Get Started",
                              onPressed: () {
                                BlocProvider.of<IntroCubit>(context)
                                    .completeIntro();
                              },
                              icon: Icons.arrow_right_alt,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
