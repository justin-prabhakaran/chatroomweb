part of 'room_bloc.dart';

sealed class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomCreatedState extends RoomInitial {
  final RoomEntity newRoom;
  RoomCreatedState(this.newRoom);
}

class ErrorState extends RoomState {}

class RoomLoadingState extends RoomInitial {}

class RoomLoadedState extends RoomInitial {}

class RoomJoinedState extends RoomInitial {}

class ShowSnackState extends RoomInitial {
  final String text;

  ShowSnackState(this.text);
}
