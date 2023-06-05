import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/models/register/register.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/util/validation.dart';
import 'package:copy_n_sync/ui/shared/dialog/setup_dialog.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:copy_n_sync/ui/views/authentication/sign_up/signup.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class SignUpViewModel extends FormViewModel {
  final _navigation = locator<NavigationService>();
  final _dialog = locator<DialogService>();
  final _server = locator<ServerService>();
  final snackbar = locator<SnackbarService>();

  String status = "";

  register() async {
    if (hasEmailValidationMessage ||
        hasPasswordValidationMessage ||
        hasCpasswordValidationMessage ||
        hasUsernameValidationMessage ||
        emailValue == null ||
        passwordValue == null ||
        cpasswordValue == null ||
        usernameValue == null) {
      snackbar.showSnackbar(message: "Fields Cannot be empty");
    } else {
      SetLoading(true);
      final response = await _server.register(
          name: "",
          username: usernameValue!,
          email: emailValue!,
          password: passwordValue!);
      if (response.runtimeType == String) {
        SetLoading(false);
        snackbar.showSnackbar(message: response);
      } else {
        Register data = Register.fromJson(response);
        if (data.status == "200") {
          _dialog.showCustomDialog(variant: DialogType.success);
          navigateToLogin();
        } else {
          snackbar.showSnackbar(message: data.message!);
          notifyListeners();
        }
        SetLoading(false);
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
