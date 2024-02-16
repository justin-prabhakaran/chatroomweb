import 'package:flutter/material.dart';

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
      ),
    );
  }
}
