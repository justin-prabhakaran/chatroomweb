import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:randomchatweb/features/chat/data/repositories/user_data_rep.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';
import 'package:randomchatweb/features/chat/domain/usecases/room_domain_usecase.dart';

import '../../../../data/models/user.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    on<CreateRoomEvent>((event, emit) async {
      // final UserEntity user = User.instance.userModel.toUserEntity();
      // final room = RoomEntity(name: name, id: id, pass: pass, createdBy: createdBy, createdAt: createdAt);
      await UserDataRepository().updateUser();
      final newRoom = await RoomDomainUsecase().createRoom(event.room);
      print(User.instance.userModel.rooms);
      emit(RoomCreatedState(newRoom));
    });
  }
}
