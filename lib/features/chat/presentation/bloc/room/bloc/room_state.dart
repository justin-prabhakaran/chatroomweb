part of 'room_bloc.dart';

sealed class RoomState extends Equatable {
  const RoomState();
  
  @override
  List<Object> get props => [];
}

final class RoomInitial extends RoomState {}

class RoomCreatedState extends RoomState{
  final RoomEntity newRoom;

  const RoomCreatedState(this.newRoom);

}