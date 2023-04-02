import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingSection extends StatelessWidget {
  const OnboardingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAsset.syncAcross,
          width: 300,
          fit: BoxFit.fitWidth,
        ),
        Text(
          "This is a notable feature bla bla bla black sheep",
          style: h4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
