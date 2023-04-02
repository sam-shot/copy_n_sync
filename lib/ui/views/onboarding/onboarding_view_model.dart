import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();

  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  Color one = kPrimaryColor;
  Color two = kGrey;
  Color three = kGrey;
  String buttonText = "Continue";

  PageController controller = PageController(keepPage: false, initialPage: 0);

  void setCurrentIndex(int index) {
    _currentIndex = index;
    // log.v(currentIndex);
    switch (_currentIndex) {
      case 0:
        one = kPrimaryColor;
        two = kGrey;
        three = kGrey;
        buttonText = "Continue";
        break;
      case 1:
        one = kGrey;
        two = kPrimaryColor;
        three = kGrey;
        buttonText = "Continue";
        break;
      case 2:
        one = kGrey;
        two = kGrey;
        three = kPrimaryColor;
        buttonText = "Get Started";
        break;
    }
    notifyListeners();
  }

  void buttonClick() {
    controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
    if (_currentIndex > 1) {
      _navigation.navigateTo(Routes.loginView);
    }
  }
}
