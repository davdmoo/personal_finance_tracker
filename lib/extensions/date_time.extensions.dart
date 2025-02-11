extension DateTimeExt on DateTime {
  static DateTime mondayOfTheWeek() {
    final now = DateTime.now();
    final daysSinceMonday = now.weekday - DateTime.monday;

    return now.subtract(Duration(days: daysSinceMonday));
  }
}
