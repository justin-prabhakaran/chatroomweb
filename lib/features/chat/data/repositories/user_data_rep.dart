import '../datasources/socket_io_class.dart';
import '../models/user.dart';
import '../models/user_model.dart';

class UserDataRepository {
  void createUser() {
    UserModel user = User.instance.userModel;

    SocketAPI.instance.socket.emit('createUser', user.toMap());

    SocketAPI.instance.socket.once('userCreated', (data) {
      final UserModel s = UserModel.fromMap(data);
      print(s.toString());
      User.instance.userModel = UserModel.fromMap(data);
      print(User.instance.userModel.toString());
    });
  }
}
