import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomchatweb/features/chat/presentation/bloc/chat_bloc.dart';
import 'features/chat/data/datasources/socket_io_class.dart';
import 'features/chat/data/repositories/user_data_rep.dart';
import 'common/colors.dart';
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
    return BlocProvider(
      create: (context) => ChatBloc(),
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
