import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String? hintText;
  String? labelText;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  bool? obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  CustomTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.controller,
    this.obscureText = false,
    this.prefixIcon = const SizedBox(),
    this.suffixIcon = const SizedBox(),
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        fillColor: Colors.grey.shade200,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CommonColors().appTheme, width: 3),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CommonColors().appTheme, width: 3),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
