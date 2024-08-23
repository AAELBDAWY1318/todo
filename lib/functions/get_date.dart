import 'package:flutter/material.dart';

Future<DateTime> getDate(BuildContext context) async {
  final DateTime? dateTime = await showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
    currentDate: DateTime.now(),
  );

  if (dateTime != null) {
    return dateTime;
  } else {
    return DateTime.now();
  }
}
