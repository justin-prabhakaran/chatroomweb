part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class RoomCreatedState extends ChatInitial {
  final RoomEntity room;
  final UserEntity user;

  RoomCreatedState({required this.room, required this.user});

  @override
  List<Object> get props => [room];
}

class SuccessfullState extends ChatInitial {}

class LoadingState extends ChatInitial {}
