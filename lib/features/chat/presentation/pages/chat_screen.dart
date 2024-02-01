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
          const DesktopChatScreen(), //TODO: needed for mobile
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
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        
                        border: InputBorder.none,
                        // contentPadding: const EdgeInsets.symmetric(
                        //     horizontal: 10), // Adjust padding
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5), // Adjust padding
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
