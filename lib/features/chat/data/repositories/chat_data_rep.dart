import 'dart:async';

import 'package:randomchatweb/features/chat/data/datasources/socket_io_class.dart';
import 'package:randomchatweb/features/chat/data/models/chat_model.dart';

class ChatDataRepository {
  final StreamController<ChatModle> _streamController = StreamController();

  Stream<ChatModle> get messageStream => _streamController.stream;
  ChatDataRepository() {
    SocketAPI.instance.socket.on('recieveMessage', (chat) {
      _streamController.add(ChatModle.fromMap(chat));
    });
  }
  void sendMessage(ChatModle chat) {
    SocketAPI.instance.socket.emit('sendMessage', chat.toMap());
  }
}
