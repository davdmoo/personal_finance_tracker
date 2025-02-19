import 'package:flutter/material.dart';

class NotificationSchedule {
  final int id;
  final String title;
  final String body;
  final TimeOfDay time;

  const NotificationSchedule({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
  });
}
