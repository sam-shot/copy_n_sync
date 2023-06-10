// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:copy_n_sync/ui/views/authentication/forgot_password/create_password.dart'
    as _i11;
import 'package:copy_n_sync/ui/views/authentication/forgot_password/enter_email.dart'
    as _i9;
import 'package:copy_n_sync/ui/views/authentication/forgot_password/verify_token.dart'
    as _i10;
import 'package:copy_n_sync/ui/views/authentication/login/login.dart' as _i4;
import 'package:copy_n_sync/ui/views/authentication/sign_up/signup.dart' as _i5;
import 'package:copy_n_sync/ui/views/home/home.dart' as _i6;
import 'package:copy_n_sync/ui/views/navigation_bar/bottom_navigation_view.dart'
    as _i7;
import 'package:copy_n_sync/ui/views/onboarding/onboarding.dart' as _i3;
import 'package:copy_n_sync/ui/views/settings/settings_view.dart' as _i8;
import 'package:copy_n_sync/ui/views/startup/startup_view.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const startupView = '/';

  static const onboardingView = '/onboarding-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const homeView = '/home-view';

  static const bottomNavigationView = '/bottom-navigation-view';

  static const settingsView = '/settings-view';

  static const enterEmail = '/enter-email';

  static const verifyToken = '/verify-token';

  static const createPassword = '/create-password';

  static const all = <String>{
    startupView,
    onboardingView,
    loginView,
    signUpView,
    homeView,
    bottomNavigationView,
    settingsView,
    enterEmail,
    verifyToken,
    createPassword,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i3.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i5.SignUpView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i6.HomeView,
    ),
    _i1.RouteDef(
      Routes.bottomNavigationView,
      page: _i7.BottomNavigationView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i8.SettingsView,
    ),
    _i1.RouteDef(
      Routes.enterEmail,
      page: _i9.EnterEmail,
    ),
    _i1.RouteDef(
      Routes.verifyToken,
      page: _i10.VerifyToken,
    ),
    _i1.RouteDef(
      Routes.createPassword,
      page: _i11.CreatePassword,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.OnboardingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.OnboardingView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => _i4.LoginView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i5.SignUpView: (data) {
      final args = data.getArgs<SignUpViewArguments>(
        orElse: () => const SignUpViewArguments(),
      );
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => _i5.SignUpView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i6.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => _i6.HomeView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i7.BottomNavigationView: (data) {
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i7.BottomNavigationView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.SettingsView: (data) {
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i8.SettingsView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.EnterEmail: (data) {
      final args = data.getArgs<EnterEmailArguments>(
        orElse: () => const EnterEmailArguments(),
      );
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => _i9.EnterEmail(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i10.VerifyToken: (data) {
      final args = data.getArgs<VerifyTokenArguments>(
        orElse: () => const VerifyTokenArguments(),
      );
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => _i10.VerifyToken(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i11.CreatePassword: (data) {
      final args = data.getArgs<CreatePasswordArguments>(
        orElse: () => const CreatePasswordArguments(),
      );
      return _i12.CupertinoPageRoute<dynamic>(
        builder: (context) => _i11.CreatePassword(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class SignUpViewArguments {
  const SignUpViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class EnterEmailArguments {
  const EnterEmailArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class VerifyTokenArguments {
  const VerifyTokenArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class CreatePasswordArguments {
  const CreatePasswordArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnterEmail({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.enterEmail,
        arguments: EnterEmailArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyToken({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyToken,
        arguments: VerifyTokenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePassword({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createPassword,
        arguments: CreatePasswordArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEnterEmail({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.enterEmail,
        arguments: EnterEmailArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyToken({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyToken,
        arguments: VerifyTokenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreatePassword({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createPassword,
        arguments: CreatePasswordArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
