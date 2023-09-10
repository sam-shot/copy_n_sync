import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/models/devices_model.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DevicesViewModel extends BaseViewModel {
  final _server = locator<ServerService>();
  final snackbar = locator<SnackbarService>();
  final _prefs = locator<SharedPreferencesService>();
  SharedPreferencesService get pref => _prefs;
  final _navigation = locator<NavigationService>();

  DevicesModel? data;

  bool showReload = false;

  init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final res = await _server.getDevices(id: _prefs.getData("userId"));

      if (res.runtimeType == String) {
        snackbar.showSnackbar(message: res);
        showReload = true;
        notifyListeners();
      } else {
        data = DevicesModel.fromJson(res);
      }
      notifyListeners();
    });
  }

  proceed() {
    if (data == null) return;
    if (data!.data!.devices!.length > 3) {
      snackbar.showSnackbar(message: "Plese Reduce devices to at least 3");
    } else {
      _navigation.navigateTo(Routes.homeView);
      _prefs.saveData("fromlogin", false);
    }
  }

  removeDevice(String deviceId) async {
    SetLoading(true);
    final res = await _server.removeDevice(
        deviceId: deviceId, userId: _prefs.getData("userId"));
    if (res.runtimeType == String) {
      SetLoading(false);
      snackbar.showSnackbar(message: res);
    } else {
      data = DevicesModel.fromJson(res);
      SetLoading(false);
    }
    notifyListeners();
  }
}
