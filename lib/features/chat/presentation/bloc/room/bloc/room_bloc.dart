import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';
import 'package:randomchatweb/features/chat/domain/usecases/room_domain_usecase.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    on<CreateRoomEvent>((event, emit) async {
      try {
        emit(RoomLoadingState());
        final newRoom = await RoomDomainUsecase().createRoom(event.room);
        emit(RoomCreatedState(newRoom));
        print("==RoomCreated==");
        print(newRoom.toString());
      } catch (err) {
        emit(ErrorState());
      }
    });
  }
}
