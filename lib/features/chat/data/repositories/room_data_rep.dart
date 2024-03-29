import 'dart:async';

import 'package:randomchatweb/features/chat/data/models/user.dart';

import '../datasources/socket_io_class.dart';
import '../models/room_model.dart';
import 'user_data_rep.dart';

class RoomDataRepository {
  Future<RoomModle> createRoom(RoomModle room) async {
    Completer<RoomModle> completer = Completer();
    SocketAPI.instance.socket.emit("createRoom", room.toMap());
    SocketAPI.instance.socket.once("roomCreated", (data) async {
      final room = RoomModle.fromMap(data);
      await UserDataRepository().updateUser(room.createdBy);
      completer.complete(room);
    });

    return completer.future;
  }

  Future<bool> joinRoom(String roomId) async {
    Completer<bool> completer = Completer();
    SocketAPI.instance.socket
        .emit("joinRoom", [roomId, User.instance.userModel.uid]);
    SocketAPI.instance.socket.once("roomJoined", (isJoined) async {
      completer.complete(isJoined);
    });

    return completer.future;
  }

  Future<RoomModle> getRoom(String roomId) async {
    Completer<RoomModle> completer = Completer();
    SocketAPI.instance.socket.emit("getRoom", roomId);
    SocketAPI.instance.socket.once("roomGot", (data) async {
      final room = RoomModle.fromMap(data);
      completer.complete(room);
    });

    return completer.future;
  }
}
