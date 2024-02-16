import 'dart:convert';

import '../../domain/entities/room_entity.dart';


class RoomModle {
  final String id;
  final String name;
  final String? pass;
  final DateTime createdAt;
  final String createdBy;
  RoomModle({
    required this.id,
    required this.name,
    this.pass,
    required this.createdAt,
    required this.createdBy,
  });

  RoomModle copyWith({
    String? id,
    String? name,
    String? pass,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return RoomModle(
      id: id ?? this.id,
      name: name ?? this.name,
      pass: pass ?? this.pass,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  RoomEntity toRoomEntity() {
    return RoomEntity(
        name: name,
        id: id,
        pass: pass,
        createdBy: createdBy,
        createdAt: createdAt);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (pass != null) {
      result.addAll({'pass': pass});
    }
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    result.addAll({'createdBy': createdBy});

    return result;
  }

  factory RoomModle.fromMap(Map<String, dynamic> map) {
    return RoomModle(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      pass: map['pass'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      createdBy: map['createdBy'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModle.fromJson(String source) =>
      RoomModle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RoomModle(id: $id, name: $name, pass: $pass, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoomModle &&
        other.id == id &&
        other.name == name &&
        other.pass == pass &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        pass.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }
}
