import '/main.dart';

class ThemePref {
  String getPref() {
    return prefs.getString('theme') ?? 'system';
  }

  Future<void> setPref(String theme) {
    return prefs.setString('theme', theme);
  }
}
