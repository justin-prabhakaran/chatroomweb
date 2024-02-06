import 'room_model.dart';

class UserModel {
  final String userName;
  final String uid;
  final List<RoomModle> rooms;

  UserModel({required this.userName, required this.uid, required this.rooms});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userName': userName});
    result.addAll({'uid': uid});
    result.addAll({'rooms': rooms.map((x) => x.toMap()).toList()});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] ?? '',
      uid: map['uid'] ?? '',
      rooms:
          List<RoomModle>.from(map['rooms']?.map((x) => RoomModle.fromMap(x))),
    );
  }

  UserModel copyWith({
    String? userName,
    String? uid,
    List<RoomModle>? rooms,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      uid: uid ?? this.uid,
      rooms: rooms ?? this.rooms,
    );
  }
}
