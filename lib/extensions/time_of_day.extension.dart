import 'dart:convert';

import 'package:flutter/material.dart';

extension TimeOfDayExt on TimeOfDay {
  String get timeDisplay {
    final hour = this.hour.toString().padLeft(2, "0");
    final minute = this.minute.toString().padLeft(2, "0");

    return "$hour:$minute";
  }

  String toJson() {
    return jsonEncode({"hour": hour, "minute": minute});
  }

  static TimeOfDay fromJson(Map<String, int> json) {
    return TimeOfDay(hour: json["hour"]!, minute: json["minute"]!);
  }
}
