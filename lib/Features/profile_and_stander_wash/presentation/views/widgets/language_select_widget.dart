import 'package:carwash/core/Utils/app_styles.dart';
import 'package:carwash/core/controllers/cubit/localizations_cubit.dart';
import 'package:carwash/core/services/shard_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String _selectedLanguage = ShardPref.getData(key: "language")??"en"; // القيمة المبدئية للغة المختارة

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          mouseCursor: SystemMouseCursors.click,
          value: "en",
          title: Text(
            "English",
            style: AppStyles.style16w500.copyWith(color: Colors.black),
          ),
          groupValue: _selectedLanguage,
          onChanged: (value) {
            setState(() {
              _selectedLanguage = value.toString();
              BlocProvider.of<LocalizationsCubit>(context)
                  .switchLanguage(value.toString());
            });
          },
        ),
        RadioListTile(
          mouseCursor: SystemMouseCursors.click,
          value: "ar",
          title: Text(
            "Arabic",
            style: AppStyles.style16w500.copyWith(color: Colors.black),
          ),
          groupValue: _selectedLanguage,
          onChanged: (value) {
            setState(() {
              _selectedLanguage = value.toString();
              BlocProvider.of<LocalizationsCubit>(context)
                  .switchLanguage(value.toString());
            });
          },
        ),
      ],
    );
  }
}
