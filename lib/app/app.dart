import 'package:copy_n_sync/ui/views/onboarding/onboarding.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: OnboardingView, initial: true)
  ],
  logger: StackedLogger(),
)
class App {}
