import 'package:bloc/bloc.dart';
import 'package:carwash/core/services/shard_pref.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'localizations_state.dart';

class LocalizationsCubit extends Cubit<Locale> {
  LocalizationsCubit() : super(const Locale('en'));
  void switchLanguage(String languageCode) {
    ShardPref.saveData(key: 'language', value: languageCode);
    emit(Locale(languageCode));
  }

  void gitLanguage() {
    var languageCode = ShardPref.getData(key: 'language');
    emit(Locale(languageCode ?? "en"));
  }
}
