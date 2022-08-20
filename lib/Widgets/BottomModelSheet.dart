import 'package:flutter/material.dart';

class BottomModelSheet {
  modalBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return child;
      },
    );
  }
}
