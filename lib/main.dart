import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/colors.dart';
import 'features/chat/data/datasources/socket_io_class.dart';
import 'features/chat/presentation/bloc/auth/auth_bloc.dart';
import 'features/chat/presentation/bloc/room/room_bloc.dart';
import 'features/chat/presentation/pages/chat_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SocketAPI.instance.createConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => RoomBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColor.dark,
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
            fontFamily: GoogleFonts.poppins().fontFamily),
        home: const ChatScreen(),
      ),
    );
  }
}
