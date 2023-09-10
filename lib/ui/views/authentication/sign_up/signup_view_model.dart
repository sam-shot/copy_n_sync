import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/models/register/register.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/core/util/validation.dart';
import 'package:copy_n_sync/ui/shared/dialog/setup_dialog.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:copy_n_sync/ui/views/authentication/sign_up/signup.form.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class SignUpViewModel extends FormViewModel {
  final _navigation = locator<NavigationService>();
  final _dialog = locator<DialogService>();
  final _server = locator<ServerService>();
  final snackbar = locator<SnackbarService>();
  final _prefs = locator<SharedPreferencesService>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  
  static const kotlinChannel = MethodChannel('kotlinPlatform');
  String status = "";

  register() async {
    if (hasEmailValidationMessage ||
        hasPasswordValidationMessage ||
        hasCpasswordValidationMessage ||
        hasUsernameValidationMessage ||
        emailValue == null ||
        passwordValue == null ||
        cpasswordValue == null ||
        passwordValue == null ||
        nameValue == null ||
        usernameValue == null) {
      snackbar.showSnackbar(message: "Fields Cannot be empty");
    } else {
      SetLoading(true);

      try {

        String deviceId =
                  await kotlinChannel.invokeMethod('getFirebaseId');
                  
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        final response = await _server.register(
            name: nameValue!,
            username: usernameValue!,
            email: emailValue!,
            firebaseId: deviceId,
            deviceName: androidInfo.model,
            password: passwordValue!);

        if (response.runtimeType == String) {
          SetLoading(false);
          snackbar.showSnackbar(message: response);
        } else {
          Register data = Register.fromJson(response);
          if (data.status == "200") {
            SetLoading(false);
                  _prefs.saveData("deviceId", deviceId);
            await _dialog.showCustomDialog(variant: DialogType.success);
            navigateToLogin();
          } else {
            snackbar.showSnackbar(message: data.message!);
            notifyListeners();
          }
          SetLoading(false);
        }
      } on Exception {
        // TODO
      }
    }
  }

  navigateToLogin() {
    _navigation.replaceWith(Routes.loginView);
  }

  @override
  void setFormStatus() {
    setEmailValidationMessage(emailValidator(emailValue ?? ""));
    setUsernameValidationMessage(usernameValidator(usernameValue ?? ""));
    setPasswordValidationMessage(passwordValidator(value: passwordValue ?? ""));
    setCpasswordValidationMessage(confirmPasswordValidator(
        value: passwordValue ?? "", newPasswordValue: cpasswordValue ?? ""));
  }
}
