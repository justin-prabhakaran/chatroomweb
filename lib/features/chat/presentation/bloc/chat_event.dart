part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class CreateRoomEvent extends ChatEvent {
  final RoomEntity room;

  const CreateRoomEvent(this.room);
}
