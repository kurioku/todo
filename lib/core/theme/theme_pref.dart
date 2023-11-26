import '/main.dart';

class ThemePref {
  String getPref() {
    return prefs.getString('theme') ?? 'system';
  }

  void setPref(String theme) {
    prefs.setString('theme', theme);
  }
}
