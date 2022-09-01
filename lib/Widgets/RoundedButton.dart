import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  String text;
  Color? textColor;
  Color? buttonColor;
  double? height;
  final GestureTapCallback? onTap;
  RoundedButton(
      {Key? key,
      required this.text,
      this.textColor,
      this.buttonColor,
      this.height,
      this.onTap})
      : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 600,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
            color: widget.buttonColor ?? CommonColors().appTheme,
            borderRadius: BorderRadius.circular(30.0)),
        child: Center(
          child: CustomText(
            widget.text,
            fontWeight: FontWeight.bold,
            color: widget.textColor ?? CommonColors().white,
          ),
        ),
      ),
    );
  }
}
