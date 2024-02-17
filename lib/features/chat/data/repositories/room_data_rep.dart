import 'dart:async';

import 'package:randomchatweb/features/chat/data/repositories/user_data_rep.dart';

import '../datasources/socket_io_class.dart';
import '../models/room_model.dart';

class RoomDataRepository {
  Future<RoomModle> createRoom(RoomModle room) async{
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
}
