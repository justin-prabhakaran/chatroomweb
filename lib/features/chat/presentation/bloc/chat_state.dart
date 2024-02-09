part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class RoomCreatedState extends ChatState {
  final RoomEntity room;

  const RoomCreatedState(this.room);
}
