import 'package:flutter/material.dart';
import 'package:flutter_tutorial/modal/ChatMessage.dart';
import 'package:flutter_tutorial/screens/chat_room/image_message.dart';
import 'package:flutter_tutorial/screens/chat_room/text_message.dart';

class Message extends StatelessWidget {
  const Message({Key? key, required this.message,required this.index}) : super(key: key);
  final ChatMessage message;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!message.isSender)
          CircleAvatar(
            backgroundImage: AssetImage(message.senderImage!),
            radius: 18,
          ),
        SizedBox(width: 8,),
         message.messageType==1?ImageMessage(message: message, index: index):
         TextMessage(message: message, index: index,)
      ],
    );
  }
}
