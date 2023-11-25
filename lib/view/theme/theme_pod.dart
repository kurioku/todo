import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_data.dart';

part 'theme_pod.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeMode build() {
    return ThemePref().theme();
  }

  void setTheme() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
    ThemePref().updateTheme(state);
  }
}
