import 'package:flutter/material.dart';

class datetimeParaDataEHora {
  DateTime originalDateTime;
  datetimeParaDataEHora({required this.originalDateTime});

  getdata() {
    DateTime dateOnly = DateTime(
      originalDateTime.year,
      originalDateTime.month,
      originalDateTime.day,
    );
    return dateOnly;
  }

  gettime() {
    TimeOfDay timeOnly = TimeOfDay(
    hour: originalDateTime.hour,
    minute: originalDateTime.minute,
  );
    return timeOnly;
  }
}
