import 'dart:ui';

import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(color: isDarkTheme ? Colors.black : Colors.white),
        bodyText2: TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
      ),
      dividerColor: CommonColors().grey,
      primarySwatch: CommonColors().theme,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(backgroundColor: CommonColors().appTheme),
    );
  }
}
