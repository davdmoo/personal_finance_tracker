import 'package:intl/intl.dart';

extension DoubleExt on double {
  String get currency {
    return NumberFormat.currency(
      locale: "id_ID",
      symbol: "Rp",
      decimalDigits: 0,
    ).format(this);
  }

  String get currencyWithoutSymbol {
    return NumberFormat.currency(
      locale: "id_ID",
      symbol: "",
      decimalDigits: 0,
    ).format(this);
  }

  static String getPercentage(double a, double b) {
    return "${(a / b * 100).toStringAsFixed(0)}%";
  }
}
