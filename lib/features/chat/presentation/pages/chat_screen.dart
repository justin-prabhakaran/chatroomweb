import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../common/colors.dart';
import '../widgets/desktop_drawer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => const DesktopChatScreen(),
      mobile: (BuildContext context) =>
          const DesktopChatScreen(), //! needed for mobile
    );
  }
}

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
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: AppColor.darkblue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                  )),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: AppColor.darkblue,
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
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
