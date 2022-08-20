import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class RowDoubleText extends StatefulWidget {
  final String firstText;
  Color? firstTextColor;
  final String lastText;
  Color? lastTextColor;
  String? priceValue;
  RowDoubleText(
      {Key? key,
      required this.firstText,
      required this.lastText,
      this.firstTextColor,
      this.lastTextColor,
      this.priceValue = ''})
      : super(key: key);
  @override
  State<RowDoubleText> createState() => _RowDoubleTextState();
}

class _RowDoubleTextState extends State<RowDoubleText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            widget.firstText,
            fontWeight: FontWeight.w400,
            color: widget.firstTextColor ?? Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          CustomText(
            widget.lastText,
            fontWeight: FontWeight.w400,
            color: widget.lastTextColor ?? Colors.grey,
          ),
        ],
      ),
    );
  }
}
