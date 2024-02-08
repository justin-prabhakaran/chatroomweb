import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomchatweb/features/chat/data/datasources/socket_io_class.dart';

import 'common/colors.dart';
import 'features/chat/presentation/pages/chat_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  SocketAPI.instance.createConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.dark,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          fontFamily: GoogleFonts.poppins().fontFamily),
      home: const ChatScreen(),
    );
  }
}
