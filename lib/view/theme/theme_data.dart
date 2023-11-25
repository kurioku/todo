import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePref {
  static ThemePref? _instance;
  static SharedPreferences? _prefs;
  static const _themeKey = 'theme';

  static init() async {
    _prefs ??= await SharedPreferences.getInstance();
    _instance ??= ThemePref();
  }

  ThemeMode theme() {
    final themeValue = _prefs!.getInt(_themeKey);
    if (themeValue == null) return ThemeMode.system;

    return ThemeMode.values[themeValue];
  }

  Future<void> updateTheme(ThemeMode theme) async {
    await _prefs!.setInt(_themeKey, theme.index);
  }
}
