import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/data/models/room_model.dart';

import 'user_entity.dart';

class RoomEntity extends Equatable {
  final String name;
  final String id;
  final UserEntity createdBy;
  // final DateTime createdAt;

  const RoomEntity({
    required this.name,
    required this.id,
    required this.createdBy,
    // / required this.createdAt
  });

  RoomModle toRoomModel() {
    return RoomModle(
        id: id,
        name: name,
        //createdAt: createdAt,
        createdBy: createdBy.toUsrModel());
  }

  @override
  List<Object?> get props => [name, id, createdBy];
}
