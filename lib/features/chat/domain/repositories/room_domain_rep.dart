import '../../data/models/room_model.dart';
import '../../data/repositories/room_data_rep.dart';
import '../entities/room_entity.dart';

class RoomDomainRepository {
  RoomDataRepository roomDataRepository = RoomDataRepository();
  Future<RoomEntity> createRoom(RoomEntity roomEntity) async {
    RoomModle roomModel =
        await roomDataRepository.createRoom(roomEntity.toRoomModel());
    return roomModel.toRoomEntity();
  }
}
