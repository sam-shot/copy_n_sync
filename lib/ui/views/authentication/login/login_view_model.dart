import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/core/models/login/login_model.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/core/services/socket_service.dart';
import 'package:copy_n_sync/core/util/validation.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login.form.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.router.dart';

class LoginViewModel extends FormViewModel {
  final _navigation = locator<NavigationService>();
  final _server = locator<ServerService>();
  final _prefs = locator<SharedPreferencesService>();
  final snackbar = locator<SnackbarService>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  navigateToSignup() {
    _navigation.replaceWith(Routes.signUpView);
  }

  static const kotlinChannel = MethodChannel('kotlinPlatform');

  login() async {
    if (hasEmailValidationMessage ||
        hasPasswordValidationMessage ||
        emailValue == null ||
        passwordValue == null) {
      snackbar.showSnackbar(message: "Fields Cannot be empty");
    } else {
      SetLoading(true);
      final response =
          await _server.login(email: emailValue!, password: passwordValue!);
      if (response.runtimeType == String) {
        SetLoading(false);
        snackbar.showSnackbar(message: response);
      } else {
        LoginModel data = LoginModel.fromJson(response);
        if (data.status == "200") {
          _prefs.saveData("userId", data.data!.id!);
          _prefs.saveData("userName", data.data!.name!);
          _prefs.saveData("syncOption", true);

          if (defaultTargetPlatform == TargetPlatform.android ) {
            try {
              String deviceId =
                  await kotlinChannel.invokeMethod('getFirebaseId');

              if (deviceId.isNotEmpty) {
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                final deviceResponse = await _server.uploadDeviceId(
                    userId: data.data!.id!,
                    firebaseId: deviceId,
                    deviceName: androidInfo.model);
                if (deviceResponse.runtimeType == String) {
                  SetLoading(false);
                  snackbar.showSnackbar(message: deviceResponse);
                } else {
                  snackbar.showSnackbar(
                      message: "Device Registered Sucessfully");

                  _prefs.saveData("deviceId", deviceId);
                  SetLoading(false);
                  snackbar.showSnackbar(message: data.message!);
                  _prefs.saveData("fromlogin", true);
                  _navigation.replaceWith(Routes.devicesView);
                }
              } else {
                SetLoading(false);
                snackbar.showSnackbar(
                    message:
                        "An Error occured, please delete app Data and try again!");
              }
            } on PlatformException {}
          } else {
            SetLoading(false);
            snackbar.showSnackbar(message: data.message!);
            _prefs.saveData("fromlogin", true);
            _navigation.replaceWith(Routes.devicesView);
          }
        } else {
          snackbar.showSnackbar(message: data.message!);
          SetLoading(false);
        }
      }
    }
  }

  forgotPassword() {
    _navigation.navigateTo(Routes.enterEmail);
  }

  @override
  void setFormStatus() {
    setEmailValidationMessage(emailValidator(emailValue ?? ""));
    setPasswordValidationMessage(passwordValidator(value: passwordValue ?? ""));
  }
}
