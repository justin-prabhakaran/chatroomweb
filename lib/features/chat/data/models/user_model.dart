import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/user_entity.dart';

class UserModel {
  final String userName;
  final String uid;
  final List<String> rooms;
  UserModel({
    required this.userName,
    required this.uid,
    required this.rooms,
  });
  UserEntity toUserEntity() {
    return UserEntity(userName: userName, uid: uid, rooms: rooms);
  }

  UserModel copyWith({
    String? userName,
    String? uid,
    List<String>? rooms,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      uid: uid ?? this.uid,
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userName': userName});
    result.addAll({'uid': uid});
    result.addAll({'rooms': rooms});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] ?? '',
      uid: map['uid'] ?? '',
      rooms: List<String>.from(map['rooms']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(userName: $userName, uid: $uid, rooms: $rooms)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userName == userName &&
        other.uid == uid &&
        listEquals(other.rooms, rooms);
  }

  @override
  int get hashCode => userName.hashCode ^ uid.hashCode ^ rooms.hashCode;
}
