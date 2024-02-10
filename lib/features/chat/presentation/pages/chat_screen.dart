import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomchatweb/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop_screen.dart';
import 'mobile_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatBloc>(context).add(PageBuildEvent());
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) => current is SuccessfullState,
      builder: (context, state) {
        return state is SuccessfullState
            ? ScreenTypeLayout.builder(
                desktop: (BuildContext context) => const DesktopChatScreen(),
                mobile: (BuildContext context) => const MobileChatScreen(),
                tablet: (BuildContext context) => const MobileChatScreen(),
              )
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
