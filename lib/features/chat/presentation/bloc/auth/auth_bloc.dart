import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/models/user.dart';
import '../../../data/repositories/user_data_rep.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<PageBuildEvent>((event, emit) async {
      try {
        const storage = FlutterSecureStorage();
        emit(LoadingState());
        String? s = await storage.read(key: 'token');
        if (s != null && s.isNotEmpty && s == User.instance.userModel.uid) {
          print("Already User Created");
          print(s);
          print(User.instance.userModel.uid);
        } else {
          await UserDataRepository().createUser();
        }
        emit(SuccessfullState());
        print("==CREATEING NEW USER===");
      } catch (err) {
        emit(ErrorState());
      }
    });
  }
}
