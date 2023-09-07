import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/dialog/setup_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:window_manager/window_manager.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupLocator();
  setupDialogUi();
  final pref = locator<SharedPreferencesService>();
  if (defaultTargetPlatform == TargetPlatform.android) {
    const androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "flutter_background example app",
      notificationText:
          "Background notification for keeping the example app running in the background",
      notificationImportance: AndroidNotificationImportance.Max,
      notificationIcon: AndroidResource(
          name: 'background_icon',
          defType: 'drawable'), // Default is ic_launcher from folder mipmap
    );

    await FlutterBackground.initialize(androidConfig: androidConfig);
    FlutterBackground.enableBackgroundExecution();
  }
  if (defaultTargetPlatform == TargetPlatform.windows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(350, 700),
      maximumSize: Size(350, 700),
      minimumSize: Size(350, 700),
      center: false,
      skipTaskbar: false,
      backgroundColor: Colors.transparent,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.setMaximizable(false);
    windowManager.setTitle("Copy N Sync");
    windowManager.setHasShadow(false);
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  AwesomeNotifications().initialize('resource://drawable/notify', [
    NotificationChannel(
        channelKey: "Copy n Sync",
        channelName: "Copy n Sync",
        importance: NotificationImportance.Max,
        criticalAlerts: true,
        channelDescription: "Copy n Sync")
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kSecondaryColor.withOpacity(0.05),
    ));
    return ScreenUtilInit(
      designSize: const Size(360, 650),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          theme: ThemeData(

              scaffoldBackgroundColor: Colors.white.withOpacity(0.06)),
          navigatorKey: StackedService.navigatorKey,
        );
      },
    );
  }
}
