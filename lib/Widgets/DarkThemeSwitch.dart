import 'package:cryptodesign/DarkTheme/DarkThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  State<ChangeThemeButtonWidget> createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, DarkThemeProvider themeNotifier, child) {
      return Switch.adaptive(
        inactiveTrackColor: Colors.grey,
        inactiveThumbColor: Colors.white,
        activeColor: Colors.white,
        activeTrackColor: Colors.black,
        value: themeNotifier.darkTheme,
        onChanged: (value) {
          // setState(() {
          //   GlobalState().isDarkMode = value;
          // });
          themeNotifier.darkTheme
              ? themeNotifier.darkTheme = false
              : themeNotifier.darkTheme = true;

          // SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
          // SharedPreferencesService(sharedPrefs).setBool('isDarkMode', value);
          // DarkModeStatus(
          //     isDarkMode:
          //         SharedPreferencesService(sharedPrefs).getBool('isDarkMode'));
        },
      );
    });
  }
}
