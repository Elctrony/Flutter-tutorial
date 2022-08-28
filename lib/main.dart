import 'package:flutter/material.dart';
import 'package:flutter_tutorial/modal/ChatMessage.dart';
import 'package:flutter_tutorial/screens/chat_room/chat_room.dart';
import 'package:flutter_tutorial/screens/sign_screen.dart';
import 'package:flutter_tutorial/utility/theme.dart';
import 'package:provider/provider.dart';

main(){
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChatMessages>.value(value: ChatMessages()),
      ],
      child: MaterialApp(
        theme: getLightTheme(context),
        home: SignScreen(),
        routes: {
          '/chat':(ctx)=>ChatRoom()
        },
      ),
    );
  }
}
