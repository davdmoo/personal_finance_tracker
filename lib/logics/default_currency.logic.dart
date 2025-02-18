import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../database.dart';

class DefaultCurrencyLogic {
  static const defaultCurrencyKey = "defaultCurrency";

  Future<Currency?> getDefaultCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(defaultCurrencyKey);
    if (json == null) return null;

    final currency = Currency.fromJson(jsonDecode(json));
    return currency;
  }

  Future<void> setDefaultCurrency(Currency data) async {
    final prefs = await SharedPreferences.getInstance();
    final json = data.toJsonString();

    await prefs.setString(defaultCurrencyKey, json);
  }
}
