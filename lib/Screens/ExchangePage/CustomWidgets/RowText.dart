// ignore_for_file: must_be_immutable

import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class RowText extends StatefulWidget {
  final String firstText;
  final String lastText;
  String? priceValue;
  RowText(
      {Key? key,
      required this.firstText,
      required this.lastText,
      this.priceValue = ''})
      : super(key: key);
  @override
  State<RowText> createState() => _RowTextState();
}

class _RowTextState extends State<RowText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            widget.firstText,
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              CustomText(
                widget.priceValue!,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                widget.lastText,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
