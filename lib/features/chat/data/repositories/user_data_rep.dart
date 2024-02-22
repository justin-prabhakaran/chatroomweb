import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../datasources/socket_io_class.dart';
import '../models/user.dart';
import '../models/user_model.dart';

class UserDataRepository {
  Future<void> createUser() {
    final UserModel user = User.instance.userModel;
    Completer<void> completer = Completer();

    SocketAPI.instance.socket.emit('createUser', user.toMap());

    SocketAPI.instance.socket.once('userCreated', (data) async {
      final user = UserModel.fromMap(data);
      User.instance.userModel = user;
      completer.complete();
      final storage = FlutterSecureStorage();

      await storage.write(key: 'token', value: user.uid);
    });
    return completer.future;
  }

  Future<UserModel> updateUser(String id) {
    final UserModel user = User.instance.userModel;
    Completer<UserModel> completer = Completer();

    SocketAPI.instance.socket.emit('getUser', id);

    SocketAPI.instance.socket.once('userGet', (data) {
      final user = UserModel.fromMap(data);
      User.instance.userModel = user;
      completer.complete(user);
    });
    return completer.future;
  }
}
