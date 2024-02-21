import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'user_model.dart';

class User {
  UserModel? _userModel;
  User._internal();
  static final User _instance = User._internal();

  static User get instance => _instance;

  UserModel get userModel {
    //TODO : not working properly
    if (_userModel == null) {
      const storage = FlutterSecureStorage();
      print("creating new user model");
      _userModel = UserModel(userName: "justin", uid: "", rooms: []);
      storage.write(key: "token", value: _userModel!.uid);
    }
    return _userModel!;
  }

  set userModel(UserModel userModel) => _userModel = userModel;
}
