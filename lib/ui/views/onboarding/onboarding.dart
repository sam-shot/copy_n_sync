import 'package:copy_n_sync/core/constants.dart';
import 'package:copy_n_sync/ui/shared/assets.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:copy_n_sync/ui/views/onboarding/onboarding_view_model.dart';
import 'package:copy_n_sync/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'widgets/onboarding_section.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const S.height(50),
                Text(
                  kAppName,
                  style: h1,
                ),
                const S.height(70),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: PageView(
                    onPageChanged: model.setCurrentIndex,
                    controller: model.controller,
                    children: [
                      OnboardingSection(
                          text: "Copy, Sync, and Amplify Your Productivity",
                          imagePath: AppAsset.onboard1),
                      OnboardingSection(
                          text: "Unleash the Power of Effortless Text Sync",
                          imagePath: AppAsset.onboard2),
                      OnboardingSection(
                          text:
                              "Ready to 10x Your Productivity? Login or Create an Account!",
                          imagePath: AppAsset.onboard3),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: model.one,
                      radius: 5,
                    ),
                    const S.width(5),
                    CircleAvatar(
                      backgroundColor: model.two,
                      radius: 5,
                    ),
                    const S.width(5),
                    CircleAvatar(
                      backgroundColor: model.three,
                      radius: 5,
                    ),
                  ],
                ),
                const S.height(20),
                CustomButton(
                  ontap: () => model.buttonClick(),
                  text: model.buttonText,
                ),
                const S.height(25)
              ],
            ),
          ),
        ));
      },
      viewModelBuilder: () => OnboardingViewModel(),
    );
  }
}
