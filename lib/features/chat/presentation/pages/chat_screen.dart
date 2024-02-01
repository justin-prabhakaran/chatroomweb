import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop_screen.dart';
import 'mobile_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => const DesktopChatScreen(),
      mobile: (BuildContext context) => const MobileChatScreen(),
      tablet: (BuildContext context) => const MobileChatScreen(),
    );
  }
}
