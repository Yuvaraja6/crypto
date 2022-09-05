import 'package:cryptodesign/Common/Animations/SplashRoute.dart';
import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:flutter/material.dart';

class NavigatorsCommon {
  newPageRoute(BuildContext context, Widget page,
      {FractionalOffset? startFractionalOffset, int? duration}) {
    Navigator.push(
        context,
        // SplashRoute(
        //   targetPage: page,
        //   splashColor: CommonColors().appTheme,
        //   startFractionalOffset:
        //       startFractionalOffset ?? FractionalOffset.center,
        //   transitionDuration: Duration(
        //     milliseconds: duration ?? 2500,
        //   ),
        // ));
        MaterialPageRoute(builder: (builder) => page));
  }

  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  newPageReplaceRoute(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => page),
        (route) => false);
  }
}
