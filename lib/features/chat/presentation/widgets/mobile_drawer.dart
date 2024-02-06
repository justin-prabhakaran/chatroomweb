import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/datasources/socket_io_class.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class MoibileDrawer extends StatelessWidget {
  const MoibileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),

          //? creating room
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Create new room",
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
              title: "Enter Password (if needed)",
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                print('called');
                SocketAPI api = SocketAPI();
                api.connect();
                api.event("createroom", {"name": "name", "pass": "data"});
                api.on("roomcreated", (data) {
                  print(data);
                });
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
    );
  }
}
