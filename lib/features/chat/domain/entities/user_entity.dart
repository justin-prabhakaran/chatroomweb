import 'package:equatable/equatable.dart';
import '../../data/models/user_model.dart';

class UserEntity extends Equatable {
  final String userName;
  final String uid;
  final List<String> rooms;

  const UserEntity(
      {required this.userName, required this.uid, required this.rooms});

  UserModel toUserModel() {
    return UserModel(userName: userName, uid: uid, rooms: rooms);
  }

  @override
  List<Object?> get props => [userName, uid, rooms];
}
