import 'package:flutter/material.dart';

Future<TimeOfDay> getTime(BuildContext context) async {
  final TimeOfDay? timeOfDay = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (timeOfDay != null) {
    return timeOfDay;
  } else {
    return TimeOfDay.now();
  }
}
