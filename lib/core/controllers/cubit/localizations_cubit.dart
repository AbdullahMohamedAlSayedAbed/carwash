import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'localizations_state.dart';

class LocalizationsCubit extends Cubit<Locale> {
  LocalizationsCubit() : super(const Locale('en'));
  void switchLanguage(String languageCode) {
    emit(Locale(languageCode));
  }
}
