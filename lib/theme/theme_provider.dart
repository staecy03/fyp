import 'package:flutter/material.dart';
import 'package:mansau_sabah/theme/dark_mode.dart';
import 'package:mansau_sabah/theme/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = DarkMode;
    } else {
      themeData = lightMode;
    }
  }
}
