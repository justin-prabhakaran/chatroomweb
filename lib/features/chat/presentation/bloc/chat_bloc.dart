import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/data/models/user.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';
import 'package:randomchatweb/features/chat/domain/entities/user_entity.dart';

import '../../data/repositories/user_data_rep.dart';
import '../../domain/usecases/room_domain_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<CreateRoomEvent>((event, emit) async {
      RoomEntity newroom = await RoomDomainUsecase().createRoom(event.room);
      print("Room created");
      print(newroom.toString());
      emit(
        RoomCreatedState(
          room: newroom,
          user: User.instance.userModel.toUserEntity(),
        ),
      );
    });

    on<PageBuildEvent>((event, emit) {
      emit(LoadingState());
      UserDataRepository().createUser();
      emit(SuccessfullState());
    });
  }
}
