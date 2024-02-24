import 'dart:convert';

import 'package:randomchatweb/features/chat/domain/entities/chat_entity.dart';

class ChatModle {
  final String id;
  final String text;
  final String msgBy;
  final DateTime time;
  final String roomId;
  ChatModle({
    required this.id,
    required this.text,
    required this.msgBy,
    required this.time,
    required this.roomId,
  });

  ChatEntity toChatEntity() {
    return ChatEntity(
        id: id, text: text, time: time, msgBy: msgBy, roomId: roomId);
  }

  ChatModle copyWith({
    String? id,
    String? text,
    String? msgBy,
    DateTime? time,
    String? roomId,
  }) {
    return ChatModle(
      id: id ?? this.id,
      text: text ?? this.text,
      msgBy: msgBy ?? this.msgBy,
      time: time ?? this.time,
      roomId: roomId ?? this.roomId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'text': text});
    result.addAll({'msgBy': msgBy});
    result.addAll({'time': time.millisecondsSinceEpoch});
    result.addAll({'roomId': roomId});

    return result;
  }

  factory ChatModle.fromMap(Map<String, dynamic> map) {
    return ChatModle(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      msgBy: map['msgBy'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      roomId: map['roomId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModle.fromJson(String source) =>
      ChatModle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModle(id: $id, text: $text, msgBy: $msgBy, time: $time, roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModle &&
        other.id == id &&
        other.text == text &&
        other.msgBy == msgBy &&
        other.time == time &&
        other.roomId == roomId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        msgBy.hashCode ^
        time.hashCode ^
        roomId.hashCode;
  }
}
