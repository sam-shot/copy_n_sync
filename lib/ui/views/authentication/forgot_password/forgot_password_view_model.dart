import 'dart:async';

import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/models/forgot_password/forgot_password.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/core/util/validation.dart';
import 'package:copy_n_sync/ui/shared/dialog/setup_dialog.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/create_password.form.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/enter_email.form.dart';
import 'package:copy_n_sync/ui/views/authentication/forgot_password/verify_token.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends FormViewModel {
  final _navigation = locator<NavigationService>();
  final _server = locator<ServerService>();
  final _prefs = locator<SharedPreferencesService>();
  final snackbar = locator<SnackbarService>();
  final _dialog = locator<DialogService>();

  late Timer countdownTimer;
  int countdownSeconds = 30;
  bool canResend = false;

  back() {
    _navigation.back();
  }

  startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownSeconds > 0) {
        countdownSeconds--;
        notifyListeners();
      } else {
        canResend = true;
        countdownTimer.cancel();
        notifyListeners();
      }
    });
  }

  next() async {
    if (hasEmailValidationMessage || emailValue == null) {
      snackbar.showSnackbar(message: "Fields Cannot be empty");
    } else {
      _prefs.saveData("emailTemp", emailValue!);
      SetLoading(true);
      final response = await _server.forgotPassword(email: emailValue!);
      if (response.runtimeType == String) {
      ForgotPassword forgotPassword = ForgotPassword.fromJson(response);
      SetLoading(false);
      snackbar.showSnackbar(message: forgotPassword.message!);
      } else {
        SetLoading(false);
        _navigation.replaceWith(Routes.verifyToken);
      }
    }
  }

  resend() async {
    SetLoading(true);
    final response =
        await _server.forgotPassword(email: _prefs.getData("emailTemp"));
    if (response.runtimeType == String) {
      ForgotPassword forgotPassword = ForgotPassword.fromJson(response);
      SetLoading(false);
      snackbar.showSnackbar(message: forgotPassword.message!);
    } else {
      SetLoading(false);
      countdownSeconds = 30;
      canResend = false;
      startCountdown();
      notifyListeners();
    }
  }

  verify() async {
    if (verifycodeValue == null) {
      snackbar.showSnackbar(message: "Field Cannot be empty");
    } else {
      SetLoading(true);
      final response = await _server.verifyForgotPassword(
          email: _prefs.getData("emailTemp"), code: verifycodeValue!);
      if (response.runtimeType == String) {
        SetLoading(false);
        snackbar.showSnackbar(message: response.toString()  );
      } else {
        ForgotPassword forgotPassword = ForgotPassword.fromJson(response);
        if(forgotPassword.status == "200"){
          _prefs.deleteData("emailTemp");
        _prefs.saveData("tempToken", forgotPassword.code);
        SetLoading(false);
        _navigation.replaceWith(Routes.createPassword);
        } else {
        SetLoading(false);
        snackbar.showSnackbar(message: forgotPassword.message!);
        }
      }
    }
  }

  updatePassword() async {
    if (hasPasswordValidationMessage ||
        hasCpasswordValidationMessage ||
        passwordValue == null ||
        cpasswordValue == null) {
      snackbar.showSnackbar(message: "Field Cannot be empty or have errors");
    } else {
      SetLoading(true);
      final response = await _server.updatePassword(
          token: _prefs.getData("tempToken"), password: cpasswordValue!);
      if (response.runtimeType == String) {
        SetLoading(false);
        snackbar.showSnackbar(message: response);
      } else {
        ForgotPassword forgotPassword = ForgotPassword.fromJson(response);
        if (forgotPassword.status == "200") {
          _prefs.deleteData("emailTemp");
          _prefs.deleteData("tempToken");
          SetLoading(false);
          await _dialog.showCustomDialog(variant: DialogType.success);
          _navigation.back();
        } else {
          _prefs.deleteData("emailTemp");
          _prefs.deleteData("tempToken");
          SetLoading(false);
          _navigation.back();

          snackbar.showSnackbar(message: forgotPassword.message!);
        }
      }
    }
  }

  @override
  void setFormStatus() {
    setEmailValidationMessage(emailValidator(emailValue ?? ""));
    setPasswordValidationMessage(passwordValidator(value: passwordValue ?? ""));
    setCpasswordValidationMessage(confirmPasswordValidator(
        value: passwordValue ?? "", newPasswordValue: cpasswordValue ?? ""));
  }
}
