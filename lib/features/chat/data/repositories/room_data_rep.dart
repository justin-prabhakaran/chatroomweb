import 'dart:async';

import 'package:randomchatweb/features/chat/data/datasources/socket_io_class.dart';
import 'package:randomchatweb/features/chat/data/models/room_model.dart';

class RoomDataRepository {
  Future<RoomModle> createRoom(RoomModle room) async {
    print("DATA MODEL TO MAP ");
    print(room.toMap().toString());
    Completer<RoomModle> completer = Completer();

    SocketAPI.instance.socket.emit("createRoom", room.toMap());

    SocketAPI.instance.socket.once("roomCreated", (data) {
      print("DATAMODEL FROM MAP");
      print(RoomModle.fromMap(data).toString());
      completer.complete(RoomModle.fromMap(data));
    });

    return completer.future;
  }
}
