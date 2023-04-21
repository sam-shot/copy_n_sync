import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class RecentText extends StatelessWidget {
   RecentText(
    this.text,
  );
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: kLightColor
      ),
      child: Text(text, style: p,),
    );
  }
}