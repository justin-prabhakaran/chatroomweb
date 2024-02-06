import 'user_model.dart';

class RoomModle {
  final String name;
  final String? pass;
  final DateTime createdAt;
  final UserModel createdBy;

  RoomModle(
      {required this.name,
      required this.pass,
      required this.createdAt,
      required this.createdBy});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    if (pass != null) {
      result.addAll({'pass': pass});
    }
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    result.addAll({'createdBy': createdBy.toMap()});

    return result;
  }

  factory RoomModle.fromMap(Map<String, dynamic> map) {
    return RoomModle(
      name: map['name'] ?? '',
      pass: map['pass'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      createdBy: UserModel.fromMap(map['createdBy']),
    );
  }

  RoomModle copyWith({
    String? name,
    String? pass,
    DateTime? createdAt,
    UserModel? createdBy,
  }) {
    return RoomModle(
      name: name ?? this.name,
      pass: pass ?? this.pass,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
