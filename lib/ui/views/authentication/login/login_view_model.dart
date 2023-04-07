import 'package:copy_n_sync/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.router.dart';

class LoginViewModel extends FormViewModel {
  
  final _navigation = locator<NavigationService>();

  navigateToSignup(){
    _navigation.replaceWith(Routes.signUpView);
  }

  
}