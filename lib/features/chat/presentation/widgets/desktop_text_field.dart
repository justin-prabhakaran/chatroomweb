import 'package:flutter/material.dart';
import 'package:randomchatweb/features/chat/data/models/user.dart';
import 'package:randomchatweb/features/chat/data/repositories/chat_data_rep.dart';
import 'package:randomchatweb/features/chat/domain/entities/chat_entity.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';

class DesktopTextField extends StatelessWidget {
  final RoomEntity room;
  const DesktopTextField(
    this.room, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextField(
        onSubmitted: (value) {
          //TODO : need roomId
          ChatDataRepository.sendMessage(ChatEntity(
                  id: '',
                  text: value.trim(),
                  time: DateTime.now(),
                  msgBy: User.instance.userModel.uid,
                  roomId: room.id)
              .toChatModel());
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          // contentPadding: const EdgeInsets.symmetric(
          //     horizontal: 10), // Adjust padding
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.attach_file),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.emoji_emotions),
                ),
              ],
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
