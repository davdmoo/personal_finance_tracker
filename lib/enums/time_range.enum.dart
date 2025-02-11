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
}
