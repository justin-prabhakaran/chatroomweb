import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<RoomClickedEvent>((event, emit) {
      emit(ChatRoomState(event.room));
    });
  }
}
