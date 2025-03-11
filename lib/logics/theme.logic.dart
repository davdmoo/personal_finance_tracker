import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLogic {
  static const themeKey = "theme";

  Future<ThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(themeKey);

    if (theme == null) {
      await setTheme(ThemeMode.system);
    }

    switch (theme) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setTheme(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, theme.name);
  }
}
