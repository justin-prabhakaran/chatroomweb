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

  Future<bool> joinRoom(String roomId) async {
    return await roomDataRepository.joinRoom(roomId);
  }

  Future<RoomEntity> getRoom(String roomId) async {
    final room = await roomDataRepository.getRoom(roomId);

    return room.toRoomEntity();
  }
}
