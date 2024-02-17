import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/user_data_rep.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<PageBuildEvent>((event, emit) async {
      try {
        emit(LoadingState());
        await UserDataRepository().createUser();
        emit(SuccessfullState());
        print("==CREATEING NEW USER===");
      } catch (err) {
        emit(ErrorState());
      }
    });
  }
}
