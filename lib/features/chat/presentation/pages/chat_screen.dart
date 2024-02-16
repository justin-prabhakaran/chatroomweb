import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop_screen.dart';
import 'mobile_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(PageBuildEvent());
    return BlocBuilder<AuthBloc, AuthState>(
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
