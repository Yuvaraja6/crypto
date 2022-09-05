import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/DarkTheme/DarkThemeProvider.dart';
import 'package:cryptodesign/DarkTheme/ThemeData.dart';
import 'package:cryptodesign/Screens/LoginPage/LoginPage.dart';
import 'package:cryptodesign/demo/HTML.dart';
import 'package:cryptodesign/demo/PostApi/PostApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(builder: (context, value, child) {
        return MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(
                  color: themeChangeProvider.darkTheme
                      ? Colors.black
                      : Color(0xFFF5F5F5))),
          title: 'Crypto',
          debugShowCheckedModeBanner: false,
          themeMode:
              themeChangeProvider.darkTheme ? ThemeMode.dark : ThemeMode.light,
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          home: LoginPage(),
        );
      }),
    );
  }
}
