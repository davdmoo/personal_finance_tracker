import 'package:flutter/material.dart';

import '../enums/time_range.enum.dart';
import 'date_time.extensions.dart';

extension DateTimeRangeExt on DateTimeRange {
  String displayNameFromTimeRange(TimeRange timeRange) {
    switch (timeRange) {
      case TimeRange.daily:
        return end.dateLocaleId;
      case TimeRange.weekly:
        return "${start.dateLocaleId} - ${end.dateLocaleId}";
      case TimeRange.monthly:
        return "${start.monthString} ${start.year}";
      case TimeRange.yearly:
        return end.year.toString();
      default:
        return "All Time";
    }
  }
}
