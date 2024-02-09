import 'dart:async';

import 'package:randomchatweb/features/chat/data/datasources/socket_io_class.dart';
import 'package:randomchatweb/features/chat/data/models/room_model.dart';

class RoomDataRepository {
  Future<RoomModle> createRoom(RoomModle room) async {
    Completer<RoomModle> completer = Completer();

    SocketAPI.instance.socket.emit("createRoom", room.toMap());

    SocketAPI.instance.socket.once("roomCreated", (data) {
      completer.complete(RoomModle.fromJson(data));
    });

    return completer.future;
  }
}
