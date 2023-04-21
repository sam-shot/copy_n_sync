import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clipboard/clipboard.dart';
import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/constants.dart';
import 'package:copy_n_sync/core/models/all_texts/all_texts.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/core/services/socket_service.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/views/home/home.form.dart';
import 'package:flutter/services.dart';
import 'package:rich_clipboard/rich_clipboard.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/services/server_service.dart';

import 'package:flutter/material.dart';

class HomeViewModel extends FormViewModel {
  final _navigation = locator<NavigationService>();
  final _server = locator<ServerService>();
  final _pref = locator<SharedPreferencesService>();
  final snackbar = locator<SnackbarService>();

  static HomeViewModel? _instance;

  HomeViewModel() {
    _instance = this;
  }

  String id = "";
  SocketService? socketService;
  String latestClip = "";
  List<String> allTexts = [];
  bool connected = true;

  

  getAllTexts() async {
    final response = await _server.getTexts(id: id);
    AllTexts data = AllTexts.fromJson(response);
    allTexts = data.data!;
    print(allTexts);
    notifyListeners();
  }

  openNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: "Copy n Sync",
        title: "Sync Acrosss your Devices",
        body: "Tap here to send Copied Text",
        autoDismissible: false,
        notificationLayout: NotificationLayout.Default,
        backgroundColor: kPrimaryColor,
        color: kPrimaryColor,
        payload: {"send": "true"},
        locked: true,
      ),
    );
  }

  Future init() async {
    id = _pref.getData("userId");
    socketService = SocketService(id);
    socketService!.connect();
    socketService!.eventListener("get", (data) {
      FlutterClipboard.copy(data.toString());

      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 11,
            channelKey: "Copy n Sync",
            title: "You just Recieved a text",
            body: "Paste directly anywhere",
            autoDismissible: true,
            backgroundColor: kPrimaryColor,
            fullScreenIntent: true,
            color: kPrimaryColor,
            actionType: ActionType.DismissAction),
      );
    });
    socketService!.eventListener("error", (data) {
      snackbar.showSnackbar(message: data);
    });
    socketService!.onDisconnected = onDisconnected;
    socketService!.onConnected = onConnected;
    setBusy(true);
    getAllTexts();
    await AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
    setBusy(false);
  }

  void onDisconnected() {
    connected = false;
    snackbar.showSnackbar(message: "You are Disconnected");
  }

  void onConnected() async {
    connected = true;
    openNotification();
  }

  void send() {
    if (connected == true) {
      socketService!.send(id, message: messageValue!);
    } else {
      snackbar.showSnackbar(message: "You are not connected");
    }
  }

  void logout() {
    socketService!.disconnect();
    socketService!.dispose();
    _pref.deleteData("userId");
    _navigation.replaceWith(Routes.loginView);
    AwesomeNotifications().cancelAll();
  }

  static const clipboardChannel = MethodChannel('clipboard');

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    final payload = receivedAction.payload ?? {};
    if (payload["send"] == "true") {
      String data;
      try {
        data = await clipboardChannel.invokeMethod('getClipData');
        _instance!.socketService!.send(_instance!.id, message: data);
      } on PlatformException catch (e) {}
    }
  }
}
