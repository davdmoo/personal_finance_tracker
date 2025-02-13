import 'package:flutter/material.dart';

import '../extensions/date_time.extensions.dart';
import '../extensions/string.extensions.dart';

enum TimeRange {
  daily,
  weekly,
  monthly,
  yearly,
  allTime,
  custom;

  String get displayName {
    if (this == allTime) {
      return "All time";
    }

    return name.capitalized;
  }

  DateTimeRange get dateRange {
    late DateTime startDate;
    final endDate = DateTime.now();

    switch (this) {
      case TimeRange.allTime:
        startDate = DateTime.fromMicrosecondsSinceEpoch(0);
        break;
      case TimeRange.monthly:
        startDate = DateTime(endDate.year, endDate.month, 1, 0, 0, 0, 0, 0);
        break;
      case TimeRange.weekly:
        final startOfWeek = endDate.subtract(const Duration(days: 7));
        startDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0, 0, 0);
        break;
      case TimeRange.daily:
        startDate = endDate.startOfDay;
        break;
      default:
        startDate = DateTime(endDate.year, 1, 1);
        break;
    }

    return DateTimeRange(start: startDate, end: endDate);
  }

  String get dateRangeDisplayName {
    switch (this) {
      case TimeRange.daily:
        return dateRange.end.dateLocaleId;
      case TimeRange.weekly:
        return "${dateRange.start.dateLocaleId} - ${dateRange.end.dateLocaleId}";
      case TimeRange.monthly:
        return "${dateRange.start.monthString} ${dateRange.start.year}";
      case TimeRange.yearly:
        return dateRange.end.year.toString();
      default:
        return "All Time";
    }
  }
}
