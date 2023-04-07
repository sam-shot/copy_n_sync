import 'package:copy_n_sync/core/services/api_service.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login.dart';
import 'package:copy_n_sync/ui/views/authentication/sign_up/signup.dart';
import 'package:copy_n_sync/ui/views/onboarding/onboarding.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: OnboardingView, initial: true),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: SignUpView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: ServerService),
  ],
  logger: StackedLogger(),
)
class App {}
