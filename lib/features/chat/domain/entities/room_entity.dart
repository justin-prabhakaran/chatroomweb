import 'package:equatable/equatable.dart';

import '../../data/models/room_model.dart';

class RoomEntity extends Equatable {
  final String name;
  final String id;
  final String pass;
  final String createdBy;
  final DateTime createdAt;

  const RoomEntity(
      {required this.name,
      required this.id,
      required this.pass,
      required this.createdBy,
      required this.createdAt});

  RoomModle toRoomModel() {
    return RoomModle(
        id: id,
        name: name,
        pass: pass,
        createdAt: createdAt,
        createdBy: createdBy);
  }

  @override
  List<Object?> get props => [id, name, pass, createdAt, createdBy];
}
