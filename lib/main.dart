import 'package:carwash/Features/login/data/datasource/firebase_datasource.dart';
import 'package:carwash/Features/login/data/reposotries/user_repository_impl.dart';
import 'package:carwash/Features/login/presentation/cubit/getcars/getcars_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/intro_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/login_validator_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/splash_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/splash_state.dart';
import 'package:carwash/Features/login/presentation/cubit/login/reset_password/resetpassword_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/rememberme/remember_me_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:carwash/Features/login/presentation/screens/intro.dart';
import 'package:carwash/Features/login/presentation/screens/login.dart';
import 'package:carwash/Features/login/presentation/screens/home_test.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/controllers/cubit/localizations_cubit.dart';
import 'package:carwash/core/databases/cache/cache_helper.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.containsKey('email') && prefs.containsKey('password');

  runApp(CarWash(isLoggedIn: isLoggedIn));
}

class CarWash extends StatelessWidget {
  final bool isLoggedIn;

  const CarWash({required this.isLoggedIn, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizationsCubit(),
        ),
        BlocProvider(
          create: (context) => SplashCubit()..checkAppState(),
        ),
        BlocProvider(
          create: (context) => IntroCubit(),
        ),
        BlocProvider(
          create: (context) => LoginValidationCubit(),
        ),
        BlocProvider(
          create: (context) => GetCarsCubit(FirebaseDataSource()),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(
              UserRepositoryImpl(firebaseDataSource: FirebaseDataSource())),
        ),
        BlocProvider(
          create: (context) => ResetPasswordCubit(
              UserRepositoryImpl(firebaseDataSource: FirebaseDataSource())),
        ),
        BlocProvider<RememberMeCubit>(
          create: (context) => RememberMeCubit(),
        ),
      ],
      child: BlocBuilder<LocalizationsCubit, Locale>(
        builder: (context, localeState) {
          return MaterialApp(
            locale: localeState,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
            ),
            home: isLoggedIn ? const HomeTest() : const Intro(),
          );
        },
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
