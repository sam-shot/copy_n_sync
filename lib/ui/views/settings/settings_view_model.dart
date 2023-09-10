import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final _pref = locator<SharedPreferencesService>();

  bool isAutomatic = true;
  void logout() {
    _pref.deleteData("userId");
    _navigation.replaceWith(Routes.loginView);
    AwesomeNotifications().cancelAll();
  }

  void gotoDevices(){
    
    _navigation.replaceWith(Routes.devicesView);
  }

  changeSyncOption(bool value) {
    isAutomatic = value;
    _pref.saveData("syncOption", value);

    notifyListeners();
  }

  void init() {
    bool syncData = _pref.getData("syncOption");
    isAutomatic = syncData;
  }
}
