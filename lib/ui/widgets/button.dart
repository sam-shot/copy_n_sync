import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.text,
      required this.ontap,
      this.isPrimary = true,
      this.isOutlined = false,
      super.key});

  bool isOutlined;
  String text;
  Function() ontap;
  bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isPrimary ? kPrimaryColor : kSecondaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: isPrimary
                      ? kPrimaryColor.withOpacity(0.2)
                      : kSecondaryColor.withOpacity(0.2),
                  blurRadius: 9,
                  offset: const Offset(0, 5))
            ]),
        child: Center(
            child: isPrimary
                ? Text(
                    text,
                    style: h4B.copyWith(color: kSecondaryColor),
                  )
                : Text(
                    text,
                    style: h4B.copyWith(color: kWhite),
                  )),
      ),
    );
  }
}
