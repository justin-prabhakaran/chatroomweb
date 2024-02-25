part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

class ChatRoomState extends ChatState {
  final RoomEntity room;
  const ChatRoomState(this.room);
}
