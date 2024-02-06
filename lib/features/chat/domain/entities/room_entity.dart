import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class RoomEntity extends Equatable {
  final String name;
  final String id;
  final UserEntity createdBy;
  final DateTime createdAt;

  const RoomEntity(
      {required this.name,
      required this.id,
      required this.createdBy,
      required this.createdAt});

  @override
  List<Object?> get props => [name, id, createdBy, createdAt];
}
