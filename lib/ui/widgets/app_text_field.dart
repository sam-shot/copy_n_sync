// ignore_for_file: must_be_immutable

import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  bool isPassword;
  int lines;
  String? validationMessage;
  FocusNode? focusNode;
  Function(String?)? onSubmitted;

  AppTextField({
    required this.controller,
    this.hintText = '',
    this.isPassword = false,
    this.lines = 1,
    this.validationMessage,
    this.focusNode,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: lines,
          obscureText: isPassword,
          controller: controller,
          focusNode: focusNode,
          style: h4B.copyWith(fontSize: 15),
          onFieldSubmitted: onSubmitted,
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
        ),
        Text(
          validationMessage ?? '',
          style: placeholder.copyWith(color: kError),
        ),
      ],
    );
  }
}
