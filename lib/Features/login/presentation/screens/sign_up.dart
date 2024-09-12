import 'package:carwash/Features/login/data/datasource/firebase_datasource.dart';
import 'package:carwash/Features/login/data/reposotries/user_repository_impl.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/login_validator_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/password_visibility_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/password_visibility_state.dart';
import 'package:carwash/Features/login/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/sign_up/sign_up_state.dart';
import 'package:carwash/Features/login/presentation/screens/car_type.dart';
import 'package:carwash/Features/login/presentation/screens/login.dart';
import 'package:carwash/Features/login/presentation/widgets/blububle.dart';
import 'package:carwash/Features/login/presentation/widgets/button_weidget.dart';
import 'package:carwash/Features/login/presentation/widgets/custome_text_feild.dart';
import 'package:carwash/Features/login/presentation/widgets/small_text_weidget.dart';
import 'package:carwash/Features/login/presentation/widgets/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final firebaseDataSource = FirebaseDataSource();
    final userRepository =
        UserRepositoryImpl(firebaseDataSource: firebaseDataSource);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginValidationCubit()),
        BlocProvider(create: (context) => PasswordVisibilityCubit()),
        BlocProvider(create: (context) => SignUpCubit(userRepository)),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.20,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * .05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextWidget(title: "Create Account"),
                              SizedBox(height: screenHeight * 0.01),
                              const SmallTextWeidget(
                                title: "Join us now! We Wash Cars, You Relax",
                                size: 16,
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
                        top: 120,
                        left: 2,
                        child: Blububle(size: 30),
                      ),
                      const Positioned(
                        top: 110,
                        right: 2,
                        child: Blububle(size: 30),
                      ),
                      const Positioned(
                        top: 10,
                        left: 2,
                        child: Blububle(size: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.75,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: BlocListener<SignUpCubit, SignUpState>(
                        listener: (context, state) {
                          if (state is SignUpSuccess) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CarType()),
                            );
                          } else if (state is SignUpFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errorMessage)),
                            );
                          }
                        },
                        child: BlocBuilder<LoginValidationCubit,
                            LoginValidationState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SmallTextWeidget(
                                  title: "User name",
                                  size: 15,
                                  color: Colors.black,
                                ),
                                CustomTextField(
                                  controller: username,
                                  placeholder: "User name",
                                  validator: (value) {
                                    if (state.usernameError.isNotEmpty) {
                                      return state.usernameError;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                const SmallTextWeidget(
                                  title: "E-Mail",
                                  size: 15,
                                  color: Colors.black,
                                ),
                                CustomTextField(
                                  controller: email,
                                  placeholder: "E-Mail",
                                  validator: (value) {
                                    if (state.emailError.isNotEmpty) {
                                      return state.emailError;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                const SmallTextWeidget(
                                  title: "Password",
                                  size: 15,
                                  color: Colors.black,
                                ),
                                BlocBuilder<PasswordVisibilityCubit,
                                    PasswordVisibilityState>(
                                  builder: (context, passwordState) {
                                    return CustomTextField(
                                      controller: password,
                                      placeholder: "Password",
                                      obscureText:
                                          passwordState.isPasswordHidden,
                                      icon: passwordState.isPasswordHidden
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      onIconPressed: () {
                                        context
                                            .read<PasswordVisibilityCubit>()
                                            .toggleVisibility();
                                      },
                                      validator: (value) {
                                        if (state.passwordError.isNotEmpty) {
                                          return state.passwordError;
                                        }
                                        return null;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                const SmallTextWeidget(
                                  title: "Confirm Password",
                                  size: 15,
                                  color: Colors.black,
                                ),
                                BlocBuilder<PasswordVisibilityCubit,
                                    PasswordVisibilityState>(
                                  builder: (context, passwordState) {
                                    return CustomTextField(
                                      controller: confirmPassword,
                                      placeholder: "Confirm Password",
                                      obscureText:
                                          passwordState.isPasswordHidden,
                                      icon: passwordState.isPasswordHidden
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      onIconPressed: () {
                                        context
                                            .read<PasswordVisibilityCubit>()
                                            .toggleVisibility();
                                      },
                                      validator: (value) {
                                        if (value != password.text) {
                                          return 'Passwords do not match';
                                        }
                                        return null;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                ButtonWeidget(
                                  text: "Sign Up",
                                  onPressed: () async {
                                    context
                                        .read<LoginValidationCubit>()
                                        .validateEmail(email.text);
                                    context
                                        .read<LoginValidationCubit>()
                                        .validatePassword(password.text);
                                    context
                                        .read<LoginValidationCubit>()
                                        .validateUsername(username.text);

                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    if (_formKey.currentState!.validate()) {
                                      await context.read<SignUpCubit>().signUp(
                                            email: email.text,
                                            password: password.text,
                                            username: username.text,
                                          );
                                    }
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Center(
                                  child: Text.rich(
                                    TextSpan(
                                      text: "You have an account? ",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: screenHeight * 0.02,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Login",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenHeight * 0.02,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Login()),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
