import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/chat_room/body.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Chat Room'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.local_phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          SizedBox(width: 16,)
        ],
      ),
      body: Body(),
    );
  }
}
