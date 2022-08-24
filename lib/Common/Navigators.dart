import 'package:flutter/material.dart';

class NavigatorsCommon {
  newPageRoute(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => page));
  }

  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  newPageReplaceRoute(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => page));
  }
}
