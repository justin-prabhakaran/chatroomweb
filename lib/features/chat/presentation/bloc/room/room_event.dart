part of 'room_bloc.dart';

sealed class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object> get props => [];
}

class CreateRoomEvent extends RoomEvent {
  final RoomEntity room;

  const CreateRoomEvent(this.room);
}

class JoinRoomEvent extends RoomEvent {
  final String roomId;

  const JoinRoomEvent(this.roomId);
}
class LoadingEvent extends RoomEvent{}
class LoadedEvent extends RoomEvent{}