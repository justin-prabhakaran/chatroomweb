import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomchatweb/features/chat/data/repositories/chat_data_rep.dart';
import 'package:randomchatweb/features/chat/domain/entities/chat_entity.dart';
import 'package:randomchatweb/features/chat/domain/entities/room_entity.dart';
import 'package:randomchatweb/features/chat/presentation/bloc/chat/chat_bloc.dart';

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
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is ChatRoomState) {
                    return Column(
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
                        DesktopTextField(state.room),

                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: Text('No Room Selected',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 18)),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListViewWidget extends StatefulWidget {
  const ChatListViewWidget({super.key});

  @override
  State<ChatListViewWidget> createState() => _ChatListViewWidgetState();
}

class _ChatListViewWidgetState extends State<ChatListViewWidget> {
  final List<ChatEntity> chats = [];

  @override
  void initState() {
   
    ChatDataRepository.messageStream.listen((roomEntity) {
      setState(() {
        chats.add(roomEntity);
        chats.map((e) => print(e));
      });
    });
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemCount: chats.length,
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
                          chats[index].text,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        subtitle: Text(
                          chats[index].time.toString(),
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
