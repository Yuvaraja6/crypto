import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class RoundedBoxButton extends StatefulWidget {
  String text;
  Color? textColor;
  double? height;
  double? width;
  Color? buttonColor;
  Widget? icon;
  bool? shadow;
  final GestureTapCallback? onTap;
  RoundedBoxButton(
      {Key? key,
      required this.text,
      this.textColor,
      this.height,
      this.width,
      this.buttonColor,
      this.icon = const SizedBox(),
      this.shadow = true,
      this.onTap})
      : super(key: key);

  @override
  State<RoundedBoxButton> createState() => _RoundedBoxButtonState();
}

class _RoundedBoxButtonState extends State<RoundedBoxButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? 600,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
            boxShadow: widget.shadow == false
                ? []
                : [BoxShadow(color: Colors.grey, blurRadius: 3)],
            color: widget.buttonColor ?? CommonColors().appTheme,
            borderRadius: BorderRadius.circular(20.0)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon!,
              CustomText(
                widget.text,
                fontWeight: FontWeight.bold,
                color: widget.textColor ?? CommonColors().white(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
