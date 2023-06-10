// ignore_for_file: depend_on_referenced_packages, empty_catches

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clipboard/clipboard.dart';
import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/core/models/all_texts/all_texts.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/core/services/socket_service.dart';
import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/views/home/home.form.dart';
import 'package:flutter/services.dart';
import 'package:flutter_process_text/flutter_process_text.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/services/server_service.dart';

class HomeViewModel extends FormViewModel {
  final _server = locator<ServerService>();
  final _pref = locator<SharedPreferencesService>();
  final snackbar = locator<SnackbarService>();
  final MethodChannel _contextMenuChannel =
      const MethodChannel('contextMenuChannel');

  static HomeViewModel? _instance;

  HomeViewModel() {
    _instance = this;

    _contextMenuChannel.setMethodCallHandler((call) async {
      if (call.method == 'handleContextText') {
      }
    });
  }

  // Set up method channel message handler

  String id = "";
  String username = "";
  List<Map<String, String>> allTexts = [];
  // List<String> allTexts = [];
  bool connected = true;

  getAllTexts() async {
    final response = await _server.getTexts(id: id);
    if (response.runtimeType == String) {
      snackbar.showSnackbar(message: "An error occured");
    } else {
      AllTexts data = AllTexts.fromJson(response);
      List<Map<String, String>> allTextsRaw = data.data!.map((e) {
        return {"text": e.text!, "time": e.time!};
      }).toList();
      allTexts = allTextsRaw.reversed.toList();
      notifyListeners();
    }
  }

  getUserDetail() async {
    username = _pref.getData("userName");
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
    getUserDetail();
    SocketService.instance.eventListener("get", (data) {
      FlutterClipboard.copy(data.toString());
      allTexts.insert(0,
          {"text": data.toString(), "time": DateTime.now().toUtc().toString()});
      notifyListeners();
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
    SocketService.instance.eventListener("error", (data) {
      snackbar.showSnackbar(message: data);
    });
    SocketService.instance.onDisconnected = onDisconnected;
    SocketService.instance.onConnected = onConnected;
    setBusy(true);
    getAllTexts();
    await AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
    setBusy(false);
  }

  void onDisconnected() {
    connected = false;
    // snackbar.showSnackbar(message: "You are Disconnected");
  }

  void onConnected() async {
    connected = true;
    openNotification();
    FlutterProcessText.initialize(
      showConfirmationToast: true,
      showRefreshToast: true,
      showErrorToast: true,
      confirmationMessage: "Text Added",
      refreshMessage: "Got all Text",
      errorMessage: "Some Error",
    );
  }

  void send() async {
    if (connected == true) {
      if (messageValue != null) {
        SocketService.instance
            .send(id, message: messageValue!, fromHistory: false);
        allTexts.insert(
            0, {"text": messageValue!, "time": formatDate(DateTime.now())});
        notifyListeners();
      } else {
        snackbar.showSnackbar(message: "Field must not be empty");
      }
    } else {
      snackbar.showSnackbar(message: "You are not connected");
    }
  }

  copyHistory(String data) {
    FlutterClipboard.copy(data);
  }

  sendHistory(String data) {
    if (connected == true) {
      SocketService.instance.send(id, message: data, fromHistory: true);
    } else {
      snackbar.showSnackbar(message: "You are not connected");
    }
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MM/dd EEE, hh:mm a');
    return formatter.format(dateTime);
  }

  static const clipboardChannel = MethodChannel('clipboard');

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    final payload = receivedAction.payload ?? {};
    if (payload["send"] == "true") {
      String data;
      try {
        data = await clipboardChannel.invokeMethod('getClipData');
        SocketService.instance
            .send(_instance!.id, message: data, fromHistory: false);
      } on PlatformException {}
    }
  }
}
