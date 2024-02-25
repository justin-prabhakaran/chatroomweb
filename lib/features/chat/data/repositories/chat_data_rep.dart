import 'dart:async';

import 'package:randomchatweb/features/chat/data/datasources/socket_io_class.dart';
import 'package:randomchatweb/features/chat/data/models/chat_model.dart';
import 'package:randomchatweb/features/chat/domain/entities/chat_entity.dart';

class ChatDataRepository {
  static final StreamController<ChatEntity> _streamController =
      StreamController();

  static Stream<ChatEntity> get messageStream => _streamController.stream;
  ChatDataRepository() {
    final socket = SocketAPI.instance.socket;
    print("CONSTRUCTUR CALLED");

    if (!socket.hasListeners('recieveMessage')) {
      socket.on('recieveMessage', (data) {
        _streamController.add(ChatModle.fromMap(data).toChatEntity());
      });
    }
  }
  static void sendMessage(ChatModle chat) {
    SocketAPI.instance.socket.emit('sendMessage', chat.toMap());
  }
}
