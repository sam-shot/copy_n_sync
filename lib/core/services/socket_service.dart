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
        print("${socket!.id} Connected to Socket");
        if(onConnected != null){
          onConnected!();
        }
      });
      socket!.onDisconnect((data) {
        print("Disconnected from Socket");
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


    print('Registered handler for $event');
  }

   void unregisterEvent(String event) {
    socket!.off(event);
    print('Unregistered handler for $event');
  }


   void dispose() {
     socket = null;
   }
}
