part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class RoomClickedEvent extends ChatEvent {
  final RoomEntity room;
  const RoomClickedEvent(this.room);
}
