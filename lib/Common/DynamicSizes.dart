import 'package:flutter/material.dart';

class DynamicSizes {
  dynamicHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  dynamicWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  heightSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

  widthSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
