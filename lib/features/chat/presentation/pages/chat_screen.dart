import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/room/room_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../bloc/auth/auth_bloc.dart';
import 'desktop_screen.dart';
import 'mobile_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(PageBuildEvent());
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state is RoomLoadingState) {
          BlocProvider.of<AuthBloc>(context).add((AuthLoadingEvent()));
        }
        if (state is RoomLoadedState) {
          BlocProvider.of<AuthBloc>(context).add(AuthSuccessEvent());
        }
        if (state is RoomCreatedState) {
          BlocProvider.of<AuthBloc>(context).add(AuthSuccessEvent());
        }
        if (state is RoomLoadingState) {
          BlocProvider.of<AuthBloc>(context).add((AuthLoadingEvent()));
        }
        if (state is RoomJoinedState) {
          BlocProvider.of<AuthBloc>(context).add((AuthSuccessEvent()));
        }

        if (state is ShowSnackState) {
          BlocProvider.of<AuthBloc>(context).add((AuthSuccessEvent()));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.text),
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) => current is! AuthErrorState,
        builder: (context, state) {
          if (state is SuccessfullState) {
            return ScreenTypeLayout.builder(
              desktop: (BuildContext context) => const DesktopChatScreen(),
              mobile: (BuildContext context) => const MobileChatScreen(),
              tablet: (BuildContext context) => const MobileChatScreen(),
            );
          } else if (state is AuthLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
