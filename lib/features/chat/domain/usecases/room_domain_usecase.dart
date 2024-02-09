import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';
import 'package:randomchatweb/features/chat/domain/repositories/room_domain_rep.dart';

class RoomDomainUsecase {
  RoomDomainRepository roomDomainRepository = RoomDomainRepository();
  Future<RoomEntity> createRoom(RoomEntity room) async {
    return await roomDomainRepository.createRoom(room);
  }
}
