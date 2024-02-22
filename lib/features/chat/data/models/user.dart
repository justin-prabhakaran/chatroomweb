
import 'user_model.dart';

class User {
  UserModel? _userModel;
  User._internal();
  static final User _instance = User._internal();

  static User get instance => _instance;

  UserModel get userModel {
    if (_userModel == null) {
      print("creating new user model");
      _userModel = UserModel(userName: "justin", uid: "", rooms: []);
    }
    return _userModel!;
  }

  set userModel(UserModel userModel) => _userModel = userModel;
}
