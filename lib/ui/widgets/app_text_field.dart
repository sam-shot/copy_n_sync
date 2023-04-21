import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  bool isPassword;
  int lines;

  AppTextField({
    required this.controller,
    this.hintText = '',
    this.isPassword = false,
    this.lines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      obscureText: isPassword,
      controller: controller,
      style: h4B.copyWith(fontSize: 15),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        hintText: hintText,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kSecondaryColor, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kPrimaryColor, width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kError, width: 2)),
      ),
    );
  }
}
