import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/colors.dart';
import '../widgets/desktop_drawer.dart';
import '../widgets/desktop_text_field.dart';

class DesktopChatScreen extends StatelessWidget {
  const DesktopChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return DesktopDrawer(
                  constraints: constraints,
                );
              }),
            ),
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
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const ChatListViewWidget(),
                    ),
                  ),

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
      ),
    );
  }
}

class ChatListViewWidget extends StatelessWidget {
  const ChatListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemCount: 17,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5),
                  // 35% of available width
                  child: IntrinsicWidth(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColor.lightblue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text(
                          'askdjnfnsfnkjsf asdfjadfkajskfj jaskdsjkfkjds kj sakdfjasf skjf dfufajdsdlfkj',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        subtitle: Text(
                          '12:32 AM',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
