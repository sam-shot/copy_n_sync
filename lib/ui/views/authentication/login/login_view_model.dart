import 'dart:convert';

import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/core/models/login/login_model.dart';
import 'package:copy_n_sync/core/services/server_service.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:copy_n_sync/ui/views/authentication/login/login.form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.router.dart';

class LoginViewModel extends FormViewModel {
  final _navigation = locator<NavigationService>();
  final _server = locator<ServerService>();
  final _prefs = locator<SharedPreferencesService>();

  navigateToSignup() {
    _navigation.replaceWith(Routes.signUpView);
  }

  login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SetLoading(true);
    final response =
        await _server.login(email: emailValue!, password: passwordValue!);
    if (response == false) {
    } else {
      LoginModel data = LoginModel.fromJson(response);
      if (data.status == "200") {
        await prefs.setString("userId", data.data!.id!);
        SetLoading(false);
        return _navigation.replaceWith(Routes.homeView, arguments: HomeViewArguments(id: data.data!.id!));
      }
    }
    SetLoading(false);
  }
}
