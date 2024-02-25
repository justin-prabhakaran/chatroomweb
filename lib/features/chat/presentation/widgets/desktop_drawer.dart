import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomchatweb/features/chat/domain/repositories/room_domain_rep.dart';
import 'package:randomchatweb/features/chat/presentation/bloc/chat/chat_bloc.dart';

import '../../../../common/colors.dart';

import '../../data/models/user.dart';
import '../../domain/entities/room_entity.dart';
import '../bloc/room/room_bloc.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class DesktopDrawer extends StatelessWidget {
  final BoxConstraints constraints;
  DesktopDrawer({super.key, required this.constraints});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight,
      padding: const EdgeInsets.all(5),
      color: AppColor.darkblue,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Text(
                "Chaat",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),

            //? creating room
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Create room",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              CustomTextField(
                controller: _nameController,
                title: "Enter Name",
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _passController,
                title: "Token (optinal)",
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  final user = User.instance.userModel.toUserEntity();
                  final room = RoomEntity(
                      name: _nameController.text.trim(),
                      id: '',
                      pass: _passController.text,
                      createdBy: user.uid,
                      createdAt: DateTime.now());

                  BlocProvider.of<RoomBloc>(context).add(CreateRoomEvent(room));

                  // final user = User.instance.userModel;
                },
                child: const CustomButton(title: "create"),
              ),
            ]),
            const SizedBox(
              height: 40,
            ),
            //? Joining room
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Join room",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Column(
              children: [
                CustomTextField(
                  controller: _codeController,
                  title: "Enter Code",
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    final String roomId = _codeController.text.trim();
                    BlocProvider.of<RoomBloc>(context)
                        .add(JoinRoomEvent(roomId));
                  },
                  child: const CustomButton(title: "join"),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "My Rooms",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            _RoomListWidget(constraints: constraints)
          ],
        ),
      ),
    );
  }
}

// // ignore: camel_case_types
// class _roomListWidget extends StatelessWidget {
//   const _roomListWidget({
//     required this.constraints,
//   });

//   final BoxConstraints constraints;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: constraints.maxHeight - 100,
//       child: BlocBuilder<RoomBloc, RoomState>(
//         buildWhen: (previous, current) => current is RoomCreatedState,
//         builder: (context, state) {
//           if (state is RoomCreatedState){

//             // if (LoadingOverlay.overlayEntry != null) {
//             //   LoadingOverlay.hide();
//             // }
//             return ListView.builder(
//               itemCount: User.instance.userModel.rooms.length,
//               itemBuilder: (context, index)  {

//                 final rooms = User.instance.userModel.rooms;
//                 final room = await getRoom(rooms[index]);

//                 return Container(
//                     margin: const EdgeInsets.all(10),
//                     child: //TODO : imporve widget for that
//                         ListTile(
//                       title: Text(
//                         room.name,
//                         style: GoogleFonts.poppins(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       trailing: IconButton(
//                         color: Colors.white,
//                         icon: const Icon(Icons.more_horiz),
//                         onPressed: () {},
//                       ),
//                     ));
//               },
//             );
//             //TODO : doesnt showed up !! need to improve
//           } else if (state is RoomLoadingState) {
//             return const Center(
//               child: LinearProgressIndicator(
//                 color: Colors.white,
//               ),
//             );
//             // LoadingOverlay.show(context);
//             // return const SizedBox.shrink();
//           }
//           // else if(state is Room){

//           // }

//           else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }

//   Future<RoomEntity> getRoom(String id) async {
//     return await RoomDomainRepository().getRoom(id);
//   }
// }

class _RoomListWidget extends StatelessWidget {
  const _RoomListWidget({
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight - 100,
      child: BlocBuilder<RoomBloc, RoomState>(
        buildWhen: (previous, current) => current is RoomCreatedState,
        builder: (context, state) {
          if (state is RoomCreatedState || state is RoomInitial) {
            return FutureBuilder<List<RoomEntity>>(
              future: _fetchRooms(User.instance.userModel.rooms),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  //BlocProvider.of<RoomBloc>(context).add(LoadingEvent());
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  final rooms = snapshot.data!;
                  return RoomItemWidget(rooms: rooms);
                } else {
                  return const Center(
                    child: Text(
                      'Failed to load rooms',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Future<List<RoomEntity>> _fetchRooms(List<String> roomIds) async {
    final List<RoomEntity> rooms = [];
    final repository = RoomDomainRepository();
    for (final id in roomIds) {
      final room = await repository.getRoom(id);
      rooms.add(room);
    }
    return rooms;
  }
}

class RoomItemWidget extends StatelessWidget {
  const RoomItemWidget({
    super.key,
    required this.rooms,
  });

  final List<RoomEntity> rooms;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        final room = rooms[index];
        return InkWell(
          onTap: () {
            BlocProvider.of<ChatBloc>(context).add(RoomClickedEvent(room));
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.lightblue,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                room.name,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              trailing: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ),
          ),
        );
      },
    );
  }
}
