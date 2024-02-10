import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomchatweb/features/chat/data/models/user.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';
import 'package:randomchatweb/features/chat/domain/entities/user_entity.dart';
import 'package:randomchatweb/features/chat/presentation/bloc/chat_bloc.dart';

import '../../../../common/colors.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class DesktopDrawer extends StatelessWidget {
  final BoxConstraints constraints;
  const DesktopDrawer({super.key, required this.constraints});

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
              const CustomTextField(
                title: "Enter Name",
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                title: "Password (optinal)",
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  final user = User.instance.userModel;
                  BlocProvider.of<ChatBloc>(context).add(
                    CreateRoomEvent(
                      RoomEntity(
                        name: "roomname__",
                        id: user.uid,
                        pass: "password",
                        createdAt: DateTime.now(),
                        createdBy: user.uid,
                      ),
                    ),
                  );
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
                const CustomTextField(
                  title: "Enter code",
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
          ],
        ),
      ),
    );
  }
}
