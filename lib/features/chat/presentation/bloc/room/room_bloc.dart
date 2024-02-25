import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/room_entity.dart';
import '../../../domain/usecases/room_domain_usecase.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    on<CreateRoomEvent>((event, emit) async {
      try {
        emit(RoomLoadingState());
        final newRoom = await RoomDomainUsecase().createRoom(event.room);
       
        emit(RoomCreatedState(newRoom));
      } catch (err) {
        emit(ErrorState());
      }
    });

    on<JoinRoomEvent>((event, emit) async {
      try {
        emit(RoomLoadingState());
        final bool isJoined = await RoomDomainUsecase().joinRoom(event.roomId);
        if (isJoined) {
          emit(RoomJoinedState());
        } else {
          emit(ShowSnackState('Failed to join room'));
        }
      } catch (err) {
        emit(ErrorState());
      }
    });

  }
}
