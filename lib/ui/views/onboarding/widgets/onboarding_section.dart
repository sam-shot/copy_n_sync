// ignore_for_file: must_be_immutable

import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingSection extends StatelessWidget {
  OnboardingSection({
    required this.imagePath,
    required this.text,
    super.key,
  });

  String text;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 500,
          fit: BoxFit.cover,
        ),
        const Spacer(),
        Text(
          text,
          style: h3,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
