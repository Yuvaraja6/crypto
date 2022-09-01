import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Screens/LoginPage/LoginPage.dart';
import 'package:cryptodesign/demo/HTML.dart';
import 'package:cryptodesign/demo/PostApi/PostApi.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          background: Container(color: const Color(0xFFF5F5F5))),
      title: 'Crypto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: CommonColors().theme,
          scaffoldBackgroundColor: Colors.white),
      home: LoginPage(),
    );
  }
}
