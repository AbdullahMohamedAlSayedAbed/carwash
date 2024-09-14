import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key});

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  DateTime today = DateTime.now();
  // save day to shared prefernces
  void saveDateToSharedPreferences(DateTime selectedDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_date', selectedDate.toIso8601String());
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      saveDateToSharedPreferences(day);
      print(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2024, 9, 1),
      lastDay: DateTime.now().add(const Duration(days: 30)),
      focusedDay: today,
      onDaySelected: onDaySelected,
      selectedDayPredicate: (day) => isSameDay(day, today),
      availableGestures: AvailableGestures.all,
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
