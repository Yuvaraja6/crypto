// ignore_for_file: must_be_immutable

import 'package:cryptodesign/Common/DynamicSizes.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            widget.firstText,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
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
              SizedBox(
                width: DynamicSizes().dynamicWidth(context, 0.32),
                child: CustomText(
                  widget.lastText,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
