part of 'room_bloc.dart';

sealed class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object> get props => [];
}

class CreateRoomEvent extends RoomEvent{
  final RoomEntity room;

  const CreateRoomEvent(this.room);
}