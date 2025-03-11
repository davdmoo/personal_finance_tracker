import 'package:flutter/material.dart';

extension ThemeModeExt on ThemeMode {
  static ThemeMode fromString(String value) {
    switch (value) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  String get displayName {
    switch (this) {
      case ThemeMode.dark:
        return "Dark";
      case ThemeMode.light:
        return "Light";
      default:
        return "System";
    }
  }

  IconData get icon {
    switch (this) {
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.light:
        return Icons.light_mode;
      default:
        return Icons.brightness_6_outlined;
    }
  }
}
