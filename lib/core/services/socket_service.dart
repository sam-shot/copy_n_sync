// ignore_for_file: library_prefixes

import 'package:copy_n_sync/core/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _singleton = SocketService._internal();
  static SocketService get instance => _singleton;

  IO.Socket? _socket;

  SocketService._internal();

  void initialize(String id) {
    if (_socket != null) {
      disconnect();
    }

    _socket = IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'reconnect': false,
      'query': {'userId': id}
    });
    _socket!.connect();
    _socket!.onConnect((data) {
      onConnected?.call();
      onError();
      onGet();
    });
    _socket!.onDisconnect((data) {
      onDisconnected?.call();
    });
  }

  bool get isConnected => _socket?.connected ?? false;

  void connect() {
    if (!isConnected) {
      _socket?.connect();
    }
  }

  void disconnect() {
    _socket?.close();
  }

  void send(String id, {required String message,required bool fromHistory}) {

    emit("send", {'userId': id, 'message': message, 'fromHistory' : fromHistory});
  }

  void onError(){
    eventListener("error", (data) {
      onErrorMessage?.call(data);
    });
  }
  void onGet(){
    eventListener("get", (data) {
      onGetMessage?.call(data);
    });
  }

  void emit(String event, dynamic data) {
    if (isConnected) {
      _socket!.emit(event, data);
    } else {
    }
  }

  void eventListener(String event, Function(dynamic) callback) {
    _socket?.on(event, callback);
  }

  void unregisterEvent(String event) {
    _socket?.off(event);
  }

  void dispose() {
    _socket?.dispose();
    _socket = null;
  }

  Function()? onConnected;
  Function()? onDisconnected;
  Function(String message)? onErrorMessage;
  Function(String message)? onGetMessage;
}
