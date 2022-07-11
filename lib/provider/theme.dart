
import 'package:examentema5/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode}) : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    Preferences.isDarkMode = false;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    Preferences.isDarkMode = true;
    notifyListeners();
  }
}
