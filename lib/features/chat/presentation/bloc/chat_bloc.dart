import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';

import '../../domain/usecases/room_domain_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<CreateRoomEvent>((event, emit) => createRoomEvent(event.room));
  }

  createRoomEvent(RoomEntity room) async {
    print(room.toRoomModel().toString());
    RoomEntity newroom = await RoomDomainUsecase().createRoom(room);
    emit(RoomCreatedState(room));
    print("${room.name} ===== bloc recieved");
  }
}
