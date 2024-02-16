

import 'dart:convert';

import 'room_model.dart';
import 'user_model.dart';

class ChatModle {
  final String text;
  final String time;
  final UserModel msgBy;
  final RoomModle msgTo;

  ChatModle({required this.text, required this.time, required this.msgBy, required this.msgTo});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'text': text});
    result.addAll({'time': time});
    result.addAll({'msgBy': msgBy.toMap()});
    result.addAll({'msgTo': msgTo.toMap()});
  
    return result;
  }

  factory ChatModle.fromMap(Map<String, dynamic> map) {
    return ChatModle(
      text: map['text'] ?? '',
      time: map['time'] ?? '',
      msgBy: UserModel.fromMap(map['msgBy']),
      msgTo: RoomModle.fromMap(map['msgTo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModle.fromJson(String source) => ChatModle.fromMap(json.decode(source));

  ChatModle copyWith({
    String? text,
    String? time,
    UserModel? msgBy,
    RoomModle? msgTo,
  }) {
    return ChatModle(
      text: text ?? this.text,
      time: time ?? this.time,
      msgBy: msgBy ?? this.msgBy,
      msgTo: msgTo ?? this.msgTo,
    );
  }
}
