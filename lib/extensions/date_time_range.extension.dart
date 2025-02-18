import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../enums/time_range.enum.dart';
import 'date_time.extensions.dart';

extension DateTimeRangeExt on DateTimeRange {
  String displayNameFromTimeRange(TimeRange timeRange, DateTimeRange? customTimeRange) {
    switch (timeRange) {
      case TimeRange.daily:
        return end.dateLocaleId;
      case TimeRange.weekly:
        return "${start.dateLocaleIdShortYear} - ${end.dateLocaleIdShortYear}";
      case TimeRange.monthly:
        return "${start.monthString} ${start.year}";
      case TimeRange.yearly:
        return end.year.toString();
      case TimeRange.custom:
        final timeRange = customTimeRange;
        if (timeRange == null) throw Exception("Time range must not be null if TimeRange.custom");

        return "${timeRange.start.dateLocaleIdShortYear} - ${timeRange.end.dateLocaleIdShortYear}";
      default:
        return "All Time";
    }
  }

  String get excelReportFileName {
    final start = this.start;
    final end = this.end;

    final dateFormat = DateFormat("dd-MM-yyyy", "id_ID");
    return "${dateFormat.format(start)}_to_${dateFormat.format(end)}";
  }
}
