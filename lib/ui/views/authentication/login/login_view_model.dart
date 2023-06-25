import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/core/models/login/login_model.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/core/services/socket_service.dart';
import 'package:copy_n_sync/core/util/validation.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.router.dart';

class LoginViewModel extends FormViewModel {
  final _navigation = locator<NavigationService>();
  final _server = locator<ServerService>();
  final _prefs = locator<SharedPreferencesService>();
  final snackbar = locator<SnackbarService>();

  navigateToSignup() {
    _navigation.replaceWith(Routes.signUpView);
  }

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
          SetLoading(false);
          snackbar.showSnackbar(message: data.message!);
          SocketService.instance.initialize(data.data!.id!);
          SocketService.instance.connect();
          _navigation.replaceWith(Routes.bottomNavigationView);
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
