// ignore_for_file: must_be_immutable

import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.text,
      required this.ontap,
      this.isPrimary = true,
      this.isOutlined = false,
      this.hasImage = false,
      super.key});

  bool isOutlined;
  String text;
  Function() ontap;
  bool isPrimary;
  bool hasImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isOutlined
                ? kWhite
                : isPrimary
                    ? kPrimaryColor
                    : kSecondaryColor,
            borderRadius: BorderRadius.circular(10),
            border: isOutlined
                ? Border.all(color: kSecondaryColor, width: 2)
                : const Border(),
            boxShadow: [
              BoxShadow(
                  color: isPrimary
                      ? kPrimaryColor.withOpacity(0.2)
                      : kSecondaryColor.withOpacity(0.2),
                  blurRadius: 9,
                  offset: const Offset(0, 5))
            ]),
        child: Center(
            child: hasImage
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAsset.googleIcon,
                        width: 24,
                      ),
                      const S.width(10),
                      isOutlined
                          ? Text(
                              text,
                              style: h4B.copyWith(color: kSecondaryColor),
                            )
                          : isPrimary
                              ? Text(
                                  text,
                                  style: h4B.copyWith(color: kSecondaryColor),
                                )
                              : Text(
                                  text,
                                  style: h4B.copyWith(color: kWhite),
                                )
                    ],
                  )
                : isOutlined
                    ? Text(
                        text,
                        style: h4B.copyWith(color: kSecondaryColor),
                      )
                    : isPrimary
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
