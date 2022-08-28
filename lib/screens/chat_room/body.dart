import 'package:flutter/material.dart';
import 'package:flutter_tutorial/modal/ChatMessage.dart';
import 'package:flutter_tutorial/screens/chat_room/chat_input_field.dart';
import 'package:flutter_tutorial/screens/chat_room/message.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatMessage = Provider.of<ChatMessages>(context).getMessageList;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => Message(message: chatMessage[index],index: index,),
              itemCount: chatMessage.length,
            ),
          ),
          ChatInputField()
        ],
      ),
    );
  }
}
