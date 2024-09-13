import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/promotions_entity.dart';
import 'package:carwash/Features/login/data/datasource/firebase_datasource.dart';
import 'package:carwash/Features/login/data/reposotries/user_repository_impl.dart';
import 'package:carwash/Features/login/presentation/cubit/getcars/getcars_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/intro_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/intro_state/login_validator_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/login/reset_password/resetpassword_cubit.dart';
import 'package:carwash/Features/login/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:carwash/Features/login/presentation/screens/intro.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/Utils/app_color.dart';
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
  Hive.registerAdapter(PromotionsEntityAdapter());
  await Hive.openBox<AppointmentEntity>(kAppointmentBox);
  await Hive.openBox<PromotionsEntity>(kPromotionBox);
  setupGetit();
  await ShardPref.init();
  Bloc.observer = CustomBlocObserver();
  runApp(const CarWash());
}

class CarWash extends StatelessWidget {
  const CarWash({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocalizationsCubit(),
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
              home: Intro(),
            );
          },
        ));
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
