import 'dart:convert';
import 'dart:io';

import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/models/register/register.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
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

  String status = "";

  register() async {
    SetLoading(true);
    if (passwordValue != null && cpasswordValue == passwordValue) {
      final response = await _server.register(
          name: "",
          username: usernameValue!,
          email: emailValue!,
          password: passwordValue!);
      Register data = Register.fromJson(response.data);
      if (data.status == "200") {
        status = data.message!;

        notifyListeners();
        // _navigation.navigateTo(Routes.loginView);
      } else {
        status = data.message!;

        notifyListeners();
      }
    }
    await Future.delayed(Duration(milliseconds: 200));
    SetLoading(false);
  }

  navigateToLogin() {
    _navigation.replaceWith(Routes.loginView);
  }
}
