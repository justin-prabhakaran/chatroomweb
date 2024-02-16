import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/user_data_rep.dart';
import '../../../domain/entities/room_entity.dart';
import '../../../domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(ChatInitial()) {
    on<PageBuildEvent>((event, emit) {
      emit(LoadingState());
      UserDataRepository().createUser();
      emit(SuccessfullState());
    });
  }
}
