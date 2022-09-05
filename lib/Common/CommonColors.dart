import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonColors {
  Color appTheme = Color(0xFF0050ff);
  MaterialColor theme =
      MaterialColor(0xFF0050ff, RGBGenerate().color(0, 80, 255));
  Color white(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.color!;
  }

  Color black(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!.color!;
  }

  Color grey = Colors.grey;
  Color red = Colors.red;
  Color deepOrange = Colors.deepOrange;
}

class RGBGenerate {
  Map<int, Color> color(int r, int g, int b) {
    Map<int, Color> color = {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    };
    return color;
  }
}

ValueNotifier<Color> whiteColor = ValueNotifier(Colors.white);
ValueNotifier<Color> blackColor = ValueNotifier(Colors.black);
