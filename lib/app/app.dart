import 'package:copy_n_sync/core/services/api_service.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/services/network_service.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/create_password.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/enter_email.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/verify_token.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login.dart';
import 'package:copy_n_sync/ui/views/authentication/sign_up/signup.dart';
import 'package:copy_n_sync/ui/views/home/home.dart';
import 'package:copy_n_sync/ui/views/navigation_bar/bottom_navigation_view.dart';
import 'package:copy_n_sync/ui/views/onboarding/onboarding.dart';
import 'package:copy_n_sync/ui/views/settings/settings_view.dart';
import 'package:copy_n_sync/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: OnboardingView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: SignUpView),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: BottomNavigationView),
    CupertinoRoute(page: SettingsView),
    CupertinoRoute(page: EnterEmail),
    CupertinoRoute(page: VerifyToken),
    CupertinoRoute(page: CreatePassword),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: ServerService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: SnackbarService),

    
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    )
  ],
  logger: StackedLogger(),
)
class App {}
