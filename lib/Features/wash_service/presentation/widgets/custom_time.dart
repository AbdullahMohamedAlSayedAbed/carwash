import 'package:carwash/core/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CustomTime extends StatefulWidget {
  const CustomTime({
    super.key,
  });

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  Color backgroundColor = AppColors.greyColor;
  List<bool> isSelected = [false, false, false]; // for 3 containers

  void handleTap(int index) async {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        if (i == index) {
          isSelected[i] = true;
        } else {
          isSelected[i] = false;
        }
      }
    });
  }

  // save time to shared prefrences
  void saveTime(String time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tapped_container', time);
    print(time);
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      // time 11:30
      GestureDetector(
        onTap: () {
          handleTap(0);
          saveTime("11:30 AM");
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected[0] ? Colors.blue : backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("11:30 AM"),
        ),
      ),
      // time 12:30
      GestureDetector(
        onTap: () {
          handleTap(1);
          saveTime("12:30 PM");
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected[1] ? Colors.blue : backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("12:30 PM"),
        ),
      ),
      // time 1:30
      GestureDetector(
        onTap: () {
          handleTap(2);
          saveTime("01:30 PM");
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected[2] ? Colors.blue : backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("01:30 PM"),
        ),
      ),
    ]);
  }
}
