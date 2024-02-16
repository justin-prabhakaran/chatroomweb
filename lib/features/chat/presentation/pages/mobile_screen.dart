import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/colors.dart';
import '../widgets/desktop_text_field.dart';
import '../widgets/mobile_drawer.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.dark,
          foregroundColor: Colors.white,
          title: Text(
            "Chaat",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColor.dark,
          child: MoibileDrawer(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    //? Chat List here

                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: AppColor.darkblue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                    )),

                    //? TextField here
                    const DesktopTextField(),

                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
