import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/data/models/user_model.dart';

import 'room_entity.dart';

class UserEntity extends Equatable {
  final String userName;
  final String uid;
  final List<RoomEntity> rooms;

  const UserEntity(
      {required this.userName, required this.uid, required this.rooms});

  UserModel toUsrModel() {
    return UserModel(
        userName: userName,
        uid: uid,
        rooms: rooms.map((e) => e.toRoomModel()).toList());
  }

  @override
  List<Object?> get props => [userName, uid, rooms];
}
