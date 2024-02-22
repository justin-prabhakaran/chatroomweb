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
        emit(AuthLoadingState());
        String? s = await storage.read(key: 'token');
        if (s != null && s.isNotEmpty) {
          print("Already User Created");
          print('Fetch user');
          final user = await UserDataRepository().updateUser(s);
          User.instance.userModel = user;
          print(s);
          print(User.instance.userModel);
          emit(SuccessfullState());
        } else {
          await UserDataRepository().createUser();
          emit(SuccessfullState());
        }
      } catch (err) {
        emit(AuthErrorState());
      }
    });

    on<AuthLoadingEvent>((event, emit) {
      emit(AuthLoadingState());
    });

    on<AuthSuccessEvent>((event, emit) {
      emit(SuccessfullState());
    });
  }
}
