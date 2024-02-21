import 'dart:async';

import '../datasources/socket_io_class.dart';
import '../models/room_model.dart';
import 'user_data_rep.dart';

class RoomDataRepository {
  Future<RoomModle> createRoom(RoomModle room) async {
    await UserDataRepository().updateUser();
    Completer<RoomModle> completer = Completer();
    SocketAPI.instance.socket.emit("createRoom", room.toMap());
    SocketAPI.instance.socket.once("roomCreated", (data) async {
      final room = RoomModle.fromMap(data);
      await UserDataRepository().updateUser();
      completer.complete(room);
    });

    return completer.future;
  }

  Future<bool> joinRoom(String roomId) async {
    Completer<bool> completer = Completer();
    SocketAPI.instance.socket.emit("joinRoom", roomId);
    SocketAPI.instance.socket.once("roomJoined", (isJoined) async {
      completer.complete(isJoined);
    });

    return completer.future;
  }
}
