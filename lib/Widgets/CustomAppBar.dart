import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  Color? titleColor;
  Color? backgroundColor;
  CustomAppBar(
      {Key? key,
      required this.title,
      this.titleColor,
      this.backgroundColor = Colors.transparent})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 50,
        child: Center(
            child: CustomText(widget.title,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
