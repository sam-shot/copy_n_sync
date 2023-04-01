import 'package:copy_n_sync/ui/views/onboarding/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingView extends StatelessWidget {
 const OnboardingView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<OnboardingViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => OnboardingViewModel(),
   );
 }
}