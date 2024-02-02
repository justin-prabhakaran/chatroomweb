import 'package:equatable/equatable.dart';

import 'room_entity.dart';

class UserEntity extends Equatable {
  final String userName;
  final String uid;
  final List<RoomEntity> rooms;

  const UserEntity(
      {required this.userName, required this.uid, required this.rooms});

  @override
  List<Object?> get props => [userName, uid, rooms];
}
