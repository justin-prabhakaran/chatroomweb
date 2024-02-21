import 'package:equatable/equatable.dart';

import 'room_entity.dart';
import 'user_entity.dart';

class ChatEntity extends Equatable {
  final String text;
  final String time;
  final UserEntity msgBy;
  final RoomEntity msgTo;

  const ChatEntity(
      {required this.text,
      required this.time,
      required this.msgBy,
      required this.msgTo});

  @override
  List<Object?> get props => [text, time, msgBy, msgTo];
}
