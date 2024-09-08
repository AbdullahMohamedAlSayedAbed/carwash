import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:carwash/Features/home/presentation/views/widgets/home_nav_bar_widget.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/Utils/app_route.dart';
import 'package:carwash/core/controllers/cubit/localizations_cubit.dart';
import 'package:carwash/core/services/get_it_service.dart';
import 'package:carwash/core/services/shard_pref.dart';
import 'package:carwash/firebase_options.dart';
import 'package:carwash/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'core/services/custom_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
    Hive.registerAdapter(AppointmentEntityAdapter());
     await Hive.openBox<AppointmentEntity>(kAppointmentBox);
  setupGetit();
 await ShardPref.init();
  Bloc.observer = CustomBlocObserver();
  runApp(const CarWash());
}

class CarWash extends StatelessWidget {
  const CarWash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationsCubit()..gitLanguage(),
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
            onGenerateRoute: AppRoute.onGenerateRoute,
            initialRoute: AppRoute.homeNavBar,
          );
        },
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
