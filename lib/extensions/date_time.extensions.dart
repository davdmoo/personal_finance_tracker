import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  DateTime get mondayOfTheWeek {
    final now = DateTime.now();
    final daysSinceMonday = now.weekday - DateTime.monday;

    return now.subtract(Duration(days: daysSinceMonday));
  }

  DateTime get startOfDay {
    return DateTime(year, month, day, 0, 0, 0, 0, 0);
  }

  String get dateLocaleId {
    final dateFormat = DateFormat("dd/MM/yyyy", "id_ID");
    return dateFormat.format(this);
  }

  String get dateLocaleIdShortYear {
    final dateFormat = DateFormat("dd/MM/yy", "id_ID");
    return dateFormat.format(this);
  }

  String get timeLocaleId {
    final dateFormat = DateFormat("HH:mm:ss", "id_ID");
    return dateFormat.format(this);
  }

  String get dateTimeLocaleIdShort {
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm", "id_ID");
    return dateFormat.format(this);
  }

  String get monthString {
    final dateFormat = DateFormat("MMMM");
    return dateFormat.format(this);
  }

  String get dateTimeLocaleId {
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss", "id_ID");
    return dateFormat.format(this);
  }
}
