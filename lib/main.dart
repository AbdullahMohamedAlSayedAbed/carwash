import 'package:carwash/Features/home/presentation/views/home_view.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/controllers/cubit/localizations_cubit.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
                )),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
