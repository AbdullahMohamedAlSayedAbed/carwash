import 'package:carwash/Features/services/presentation/views/payment_method_screen.dart';
import 'package:carwash/Features/services/presentation/views/service_screen.dart';
import 'package:carwash/core/Utils/api_keys.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/controllers/cubit/localizations_cubit.dart';
import 'package:carwash/core/services/get_it_service.dart';
import 'package:carwash/firebase_options.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';

import 'core/services/custom_bloc_observer.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishKey;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetit();
  Bloc.observer = CustomBlocObserver();
  runApp(const CarWash());
}

class CarWash extends StatelessWidget {
  const CarWash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationsCubit(),
      child: BlocBuilder<LocalizationsCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
            locale: state,
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
            // onGenerateRoute: AppRoute.onGenerateRoute,
            // initialRoute: AppRoute.informationScreen,
            home: const ServicesScreen(),
          );
        },
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
