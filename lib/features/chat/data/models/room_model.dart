import 'dart:convert';

import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';

import 'user_model.dart';

class RoomModle {
  final String id;
  final String name;
  final String? pass;
  // final DateTime createdAt;
  final UserModel createdBy;
  RoomModle({
    required this.id,
    required this.name,
    this.pass,
    // required this.createdAt,
    required this.createdBy,
  });

  RoomEntity toRoomEntity() {
    return RoomEntity(
      name: name,
      id: id,
      createdBy: createdBy.toUserEntity(),
      //   createdAt: createdAt);
    );
  }

  RoomModle copyWith({
    String? id,
    String? name,
    String? pass,
    DateTime? createdAt,
    UserModel? createdBy,
  }) {
    return RoomModle(
      id: id ?? this.id,
      name: name ?? this.name,
      pass: pass ?? this.pass,
      // createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (pass != null) {
      result.addAll({'pass': pass});
    }
    // result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    result.addAll({'createdBy': createdBy.toMap()});

    return result;
  }

  factory RoomModle.fromMap(Map<String, dynamic> map) {
    return RoomModle(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      pass: map['pass'],
      //  createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      createdBy: UserModel.fromMap(map['createdBy']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModle.fromJson(String source) =>
      RoomModle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RoomModle(id: $id, name: $name, pass: $pass, createdAt: createdAt, createdBy: $createdBy)';
  }
}
