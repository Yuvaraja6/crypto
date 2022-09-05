import 'package:cryptodesign/DarkTheme/DarkThemePreference.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool isDarkTheme = false;

  bool get darkTheme => isDarkTheme;

  set darkTheme(bool value) {
    isDarkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
