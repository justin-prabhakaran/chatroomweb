import 'package:randomchatweb/features/chat/data/models/room_model.dart';
import 'package:randomchatweb/features/chat/data/repositories/room_data_rep.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';

class RoomDomainRepository {
  RoomDataRepository roomDataRepository = RoomDataRepository();
  Future<RoomEntity> createRoom(RoomEntity roomEntity) async {
    RoomModle roomModel =
        await roomDataRepository.createRoom(roomEntity.toRoomModel());
    return roomModel.toRoomEntity();
  }
}
