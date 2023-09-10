// ignore_for_file: depend_on_referenced_packages, empty_catches

import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clipboard/clipboard.dart';
import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.router.dart';
import 'package:copy_n_sync/core/models/all_texts/all_texts.dart';
import 'package:copy_n_sync/core/services/shared_preferences.dart';
import 'package:copy_n_sync/core/services/socket_service.dart';
import 'package:copy_n_sync/ui/shared/loading_status.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/services/server_service.dart';

class HomeViewModel extends FormViewModel {
  final _server = locator<ServerService>();
  final _pref = locator<SharedPreferencesService>();
  final _nav = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();

  static HomeViewModel? _instance;
  HomeViewModel() {
    _instance = this;
  }

  String id = "";
  String username = "";
  String fileName = "";
  List<Map<String, String>> allTexts = [];
  // List<String> allTexts = [];
  bool connected = true;
  File? file;
  bool isUploading = false;

  getAllTexts() async {
    final response = await _server.getTexts(id: _pref.getData("userId"));
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
        payload: {"send": "true"},
        locked: true,
      ),
    );
  }

  Future init() async {
    id = _pref.getData("userId");
    getUserDetail();
    setBusy(true);
    await getAllTexts();
    openNotification();
    await AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
    setBusy(false);
  }

  copyHistory(String data) {
    FlutterClipboard.copy(data);
  }

  sendHistory(String data) async {
    SetLoading(true);
    final res = await _server.sendHistory(text: data, id: id);
    _nav.back();
  }

  selectFile(void Function(void Function()) setState) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      fileName = result.files.single.path!;
      setState(() {});
    } else {}
  }

  uploadFile(void Function(void Function()) setState) async {
    isUploading = true;
    setState(() {});
    if (file != null) {
      final res = await _server.uploadFile(userId: id, filePath: file!.path);
      print(res);

      fileName = "Upload Sucessful";

      setState(() {});
      await Future.delayed(const Duration(milliseconds: 1000));
      fileName = "No file Selected";
    }
    isUploading = false;
    setState(() {});
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MM/yy EEE, hh:mm');
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
        _instance!.allTexts.insert(
            0, {"text": data, "time": _instance!.formatDate(DateTime.now())});
        _instance!.notifyListeners();
      } on PlatformException {}
    }
  }

  void goToSettings() {
    _nav.navigateTo(Routes.settingsView);
  }
}
