import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkMode = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode {
    return _prefs.getBool("darkMode") ?? _isDarkMode;
  }

  static set isDarkMode(bool isDark) {
    _isDarkMode = isDark;
    _prefs.setBool("darkMode", _isDarkMode);
  }

  SharedPreferences get prefs => _prefs;
}
