import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    bool deviceSaved = prefs.containsKey('onboarded');
    if (!deviceSaved) {
      bool userLogged = prefs.containsKey('userId');
      if (userLogged) {
        _navigation.replaceWith(Routes.bottomNavigationView);
      } else {
        _navigation.replaceWith(Routes.loginView);
      }
    } else {
      _navigation.replaceWith(Routes.onboardingView);
    }
  }
}
