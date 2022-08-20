import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String data;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  CustomText(@required this.data,
      {Key? key,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 16,
      this.color = Colors.black,
      this.textAlign,
      this.overflow})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      textAlign: widget.textAlign ?? TextAlign.left,
      style: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight),
      overflow: widget.overflow,
    );
  }
}
