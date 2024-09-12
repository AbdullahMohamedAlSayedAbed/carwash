import 'package:flutter/material.dart';

class SettingsItemModel {
  final Color? backgroundColor;
  final String text;
  final IconData icon;
  final void Function()? onTap;

  SettingsItemModel(
      {this.onTap, required this.backgroundColor, required this.text, required this.icon});
}
