import 'dart:async';

import '../datasources/socket_io_class.dart';
import '../models/user.dart';
import '../models/user_model.dart';

class UserDataRepository {
  Future<void> createUser() {
    final UserModel user = User.instance.userModel;
    Completer<void> completer = Completer();
    
    SocketAPI.instance.socket.emit('createUser', user.toMap());

    SocketAPI.instance.socket.once('userCreated', (data) async {
      User.instance.userModel = UserModel.fromMap(data);
      completer.complete();
    });
    return completer.future;
  }

  Future<void> updateUser() {
    final UserModel user = User.instance.userModel;
    Completer<void> completer = Completer();

    SocketAPI.instance.socket.emit('getUser', user.toMap());

    SocketAPI.instance.socket.once('userGet', (data) {
      User.instance.userModel = UserModel.fromMap(data);
      completer.complete();
    });
    return completer.future;
  }
}
