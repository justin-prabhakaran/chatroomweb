import '../entities/room_entity.dart';
import '../repositories/room_domain_rep.dart';

class RoomDomainUsecase {
  RoomDomainRepository roomDomainRepository = RoomDomainRepository();
  Future<RoomEntity> createRoom(RoomEntity room) async {
    return await roomDomainRepository.createRoom(room);
  }

  Future<bool> joinRoom(String roomId) async {
    return roomDomainRepository.joinRoom(roomId);
  }

  Future<RoomEntity> getRoom(String roomId) async {
   return await roomDomainRepository.getRoom(roomId);
  }
}
