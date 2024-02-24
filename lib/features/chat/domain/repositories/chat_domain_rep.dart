import 'dart:async';

import 'package:randomchatweb/features/chat/data/models/chat_model.dart';
import 'package:randomchatweb/features/chat/data/repositories/chat_data_rep.dart';
import 'package:randomchatweb/features/chat/domain/entities/chat_entity.dart';

class ChatDomainRepository {
  final StreamController<ChatEntity> _streamController = StreamController();

  Stream<ChatEntity> get messageStream => _streamController.stream;

  ChatDataRepository chatDataRepository = ChatDataRepository();
  ChatDomainRepository() {
    chatDataRepository.messageStream.listen((ChatModle chatModle) {
      _streamController.add(chatModle.toChatEntity());
    });
  }

  void sendMessage(ChatEntity entity) {
    chatDataRepository.sendMessage(entity.toChatModel());
  }
}
