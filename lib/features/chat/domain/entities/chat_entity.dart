import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/domain/entities/user_entity.dart';

class ChatEntity extends Equatable {
  final String text;
  final String time;
  final UserEntity msgBy;

  const ChatEntity(
      {required this.text, required this.time, required this.msgBy});

  @override
  List<Object?> get props => [text, time, msgBy];
}
