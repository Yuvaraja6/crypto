import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String? hintText;
  String? labelText;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Color? fillColor;
  bool? obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  CustomTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.controller,
    this.fillColor,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      textAlignVertical: TextAlignVertical.center,
      obscureText: widget.obscureText!,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        border: InputBorder.none,
        hintText: widget.hintText,
        labelText: widget.labelText,
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: CommonColors().appTheme, width: 3),
              borderRadius: BorderRadius.circular(30.0),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: CommonColors().appTheme, width: 3),
              borderRadius: BorderRadius.circular(30.0),
            ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
