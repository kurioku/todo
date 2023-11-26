import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_pref.dart';

part 'theme_pod.g.dart';

@riverpod
class ThemeS extends _$ThemeS {
  @override
  String build() {
    return ThemePref().getPref();
  }

  void change(String theme) {
    state = theme;
    ThemePref().setPref(theme);
  }
}

@riverpod
ThemeMode theme(ThemeRef ref) {
  final theme = ref.watch(themeSPod);
  if (theme == 'dark') {
    return ThemeMode.dark;
  } else if (theme == 'light') {
    return ThemeMode.light;
  }
  return ThemeMode.system;
}
