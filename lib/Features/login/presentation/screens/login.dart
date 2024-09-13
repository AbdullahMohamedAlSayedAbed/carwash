import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carwash/Features/home/presentation/views/home_nav_bar_widget.dart';
import 'package:carwash/Features/home/presentation/views/home_view.dart';
import 'package:carwash/Features/login/data/datasource/firebase_datasource.dart';
import 'package:carwash/Features/login/data/reposotries/user_repository_impl.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/login_validator_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/password_visibility_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/password_visibility_state.dart';
import 'package:carwash/Features/login/presentation/cubit/login/login_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/login/login_state.dart';
import 'package:carwash/Features/login/presentation/cubit/login/reset_password/resetpassword_cubit.dart';
import 'package:carwash/Features/login/presentation/screens/car_type.dart';
import 'package:carwash/Features/login/presentation/screens/sign_up.dart';
import 'package:carwash/Features/login/presentation/widgets/blububle.dart';
import 'package:carwash/Features/login/presentation/widgets/button_weidget.dart';
import 'package:carwash/Features/login/presentation/widgets/custome_text_feild.dart';
import 'package:carwash/Features/login/presentation/widgets/forget_password.dart';
import 'package:carwash/Features/login/presentation/widgets/small_text_weidget.dart';
import 'package:carwash/Features/login/presentation/widgets/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final userRepository =
        UserRepositoryImpl(firebaseDataSource: FirebaseDataSource());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginValidationCubit(),
        ),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(userRepository),
        ),
      ],
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInWithGoogleSuccess) {
            if (state.message == "Needs car type") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CarType()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeNavBarWidget()),
              );
            }
          } else if (state is SignInWithFacebookSuccess) {
            if (state.message == "Needs car type") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CarType()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeNavBarWidget()),
              );
            }
          } else if (state is SignInWithEmailSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeNavBarWidget()),
            );
          } else if (state is SignInWithFacebookSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeNavBarWidget()),
            );
          } else if (state is SignInFailure) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Error',
              desc: state.errorMessage,
              btnOkOnPress: () {},
            ).show();
          }
        },
        child: BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: state is SignInLoading
                  ? const CircleAvatar()
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.28,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * .05),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const TextWidget(
                                                    title: "Sign in to your"),
                                                const TextWidget(
                                                    title: "account"),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                const SmallTextWeidget(
                                                  title: "Welcome back",
                                                  size: 16,
                                                ),
                                                const SmallTextWeidget(
                                                  title:
                                                      "Select method to log in:",
                                                  size: 17,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 15,
                                          right: 0,
                                          child: Blububle(size: 50),
                                        ),
                                        const Positioned(
                                          top: 175,
                                          left: 2,
                                          child: Blububle(size: 25),
                                        ),
                                        const Positioned(
                                          top: 150,
                                          right: 1,
                                          child: Blububle(size: 50),
                                        ),
                                        const Positioned(
                                          top: 15,
                                          left: 2,
                                          child: Blububle(size: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Form(
                                      key: _formKey,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * .05,
                                            vertical: screenWidth * .02),
                                        child: BlocBuilder<LoginValidationCubit,
                                            LoginValidationState>(
                                          builder: (context, state) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                const SmallTextWeidget(
                                                  title: "E-Mail",
                                                  size: 15,
                                                  color: Colors.black,
                                                ),
                                                CustomTextField(
                                                  controller: emailController,
                                                  placeholder: "E-Mail",
                                                  validator: (value) {
                                                    if (state.emailError
                                                        .isNotEmpty) {
                                                      return state.emailError;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                const SmallTextWeidget(
                                                  title: "PassWord",
                                                  size: 15,
                                                  color: Colors.black,
                                                ),
                                                BlocBuilder<
                                                    PasswordVisibilityCubit,
                                                    PasswordVisibilityState>(
                                                  builder: (context,
                                                      visibilityState) {
                                                    return CustomTextField(
                                                      controller:
                                                          passwordController,
                                                      placeholder: "PassWord",
                                                      obscureText:
                                                          visibilityState
                                                              .isPasswordHidden,
                                                      icon: visibilityState
                                                              .isPasswordHidden
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      onIconPressed: () {
                                                        context
                                                            .read<
                                                                PasswordVisibilityCubit>()
                                                            .toggleVisibility();
                                                      },
                                                      validator: (value) {
                                                        if (state.passwordError
                                                            .isNotEmpty) {
                                                          return state
                                                              .passwordError;
                                                        }
                                                        return null;
                                                      },
                                                    );
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                          value: false,
                                                          onChanged:
                                                              (newValue) {},
                                                        ),
                                                        const Text(
                                                            "Remember me"),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return BlocProvider
                                                                .value(
                                                              value: context.read<
                                                                  ResetPasswordCubit>(),
                                                              child: ForGetPassWord(
                                                                  emailController:
                                                                      emailController),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Text(
                                                        "Forgot password?",
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                ButtonWeidget(
                                                  text: "Login",
                                                  onPressed: () async {
                                                    context
                                                        .read<
                                                            LoginValidationCubit>()
                                                        .validateEmail(
                                                            emailController
                                                                .text);
                                                    context
                                                        .read<
                                                            LoginValidationCubit>()
                                                        .validatePassword(
                                                            passwordController
                                                                .text);

                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100));

                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      context
                                                          .read<SignInCubit>()
                                                          .signInWithEmail(
                                                            emailController
                                                                .text,
                                                            passwordController
                                                                .text,
                                                          );
                                                    }
                                                  },
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.02),
                                                const Row(
                                                  children: [
                                                    Expanded(
                                                      child: Divider(
                                                        color: Colors.grey,
                                                        thickness: 1,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        "or login with",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Divider(
                                                        color: Colors.grey,
                                                        thickness: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.02),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          screenWidth * 0.03),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  SignInCubit>()
                                                              .signInWithGmail();
                                                        },
                                                        child: Image.asset(
                                                          'images/google.png',
                                                          width:
                                                              screenWidth * 0.1,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            screenWidth * 0.05),
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          screenWidth * 0.03),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  SignInCubit>()
                                                              .signInWithFacebook();
                                                        },
                                                        child: Image.asset(
                                                          'images/facebook-.png',
                                                          width:
                                                              screenWidth * 0.1,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.02),
                                                Center(
                                                  child: Text.rich(
                                                    TextSpan(
                                                      text:
                                                          "Haven't sign up yet? ",
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontSize:
                                                            screenHeight * 0.02,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: "Sign up",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                screenHeight *
                                                                    0.02,
                                                          ),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const SignUP()),
                                                                  );
                                                                },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
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
            ),
          );
        }),
      ),
    );
  }
}
