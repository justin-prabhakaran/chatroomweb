import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/data/models/chat_model.dart';

import 'user_entity.dart';

class ChatEntity extends Equatable {
  final String id;
  final String text;
  final DateTime time;
  final String msgBy;
  final String roomId;

  const ChatEntity(
      {required this.id,
      required this.text,
      required this.time,
      required this.msgBy,
      required this.roomId});

  ChatModle toChatModel() {
    return ChatModle(
        id: id, text: text, msgBy: msgBy, time: time, roomId: roomId);
  }

  @override
  List<Object?> get props => [id, text, time, msgBy, roomId];
}
