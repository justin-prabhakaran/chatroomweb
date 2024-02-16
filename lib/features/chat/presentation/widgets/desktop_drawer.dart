import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';
import 'package:randomchatweb/features/chat/presentation/bloc/room/bloc/room_bloc.dart';

import '../../../../common/colors.dart';
import '../../data/models/user.dart';
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                  //TODO: add create room event
                  final user = User.instance.userModel.toUserEntity();
                  final room = RoomEntity(
                      name: _nameController.text.trim(),
                      id: '',
                      pass: _passController.text.trim(),
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
                  onTap: () {},
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
            SizedBox(
                height: constraints.maxHeight - 100,
                child: BlocBuilder<RoomBloc, RoomState>(
                  buildWhen: (previous, current) => current is RoomCreatedState,
                  builder: (context, state) {
                    final user = User.instance.userModel.toUserEntity();
                    return state is RoomCreatedState
                        ? ListView.builder(
                            itemCount: user.rooms.length,
                            itemBuilder: (context, index) {
                              print(user.rooms);
                              return Container(
                                margin: const EdgeInsets.all(1),
                                child: Text(index.toString()),
                              );
                            },
                          )
                        : Container();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
