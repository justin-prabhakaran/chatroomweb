import 'dart:async';

import '../datasources/socket_io_class.dart';
import '../models/user.dart';
import '../models/user_model.dart';

class UserDataRepository {
  final UserModel user = User.instance.userModel;
  void createUser() {
    SocketAPI.instance.socket.emit('createUser', user.toMap());

    SocketAPI.instance.socket.once('userCreated', (data) {
      final UserModel s = UserModel.fromMap(data);
      print(s.toString());
      User.instance.userModel = UserModel.fromMap(data);
      print(User.instance.userModel.toString());
    });
  }

  Future<void> updateUser() {
    Completer<void> completer = Completer();
    SocketAPI.instance.socket.emit('getUser', user.toMap());

    SocketAPI.instance.socket.once('userGet', (data) {
      User.instance.userModel = UserModel.fromMap(data);
      completer.complete();
      print(User.instance.userModel.toString);
    });
    return completer.future;
  }
}
