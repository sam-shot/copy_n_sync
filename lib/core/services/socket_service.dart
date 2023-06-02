import 'package:copy_n_sync/core/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
   IO.Socket? socket;
   String? id;

  SocketService(this.id);

  Function()? onConnected;
  Function()? onDisconnected;


    connect() {
      socket = IO.io(baseUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'reconnect': false,
        'query': {'userId': id}
      });
      socket!.connect();
      socket!.onConnect((data) {
        if(onConnected != null){
          onConnected!();
        }
      });
      socket!.onDisconnect((data) {
        if(onDisconnected != null){
          onDisconnected!();
        }
      });
    }

    disconnect() {
     socket!.close();
     if(onDisconnected != null){
       onDisconnected!();
     }
   }

   void send(String id,{required String message}){
      emit("send", {'userId': id, 'message': message});
   }

   void emit(String event, dynamic data) {
    if (socket!.connected) {
      socket!.emit(event, data);
      print('Emitted $event: $data');
    } else {
      print('Error: socket not connected');
    }
  }

  void eventListener(String event, Function(dynamic) callback) {
    socket!.on(event, callback);


  }

   void unregisterEvent(String event) {
    socket!.off(event);
  }


   void dispose() {
    socket!.dispose();
     socket = null;
   }
}
