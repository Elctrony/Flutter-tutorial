import 'package:flutter/material.dart';
import 'package:flutter_tutorial/modal/ChatMessage.dart';
import 'package:flutter_tutorial/utility/constants.dart';

class TextMessage extends StatelessWidget {
  TextMessage({Key? key, required this.message,required this.index}) : super(key: key);
  final ChatMessage message;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.75, horizontal: kDefaultPadding / 1.5),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(message.isSender ? 1.0 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (!message.isSender)
              ? Text(
                  message.sender!,
                  style: TextStyle(
                      color: nameColors[index%nameColors.length], fontWeight: FontWeight.w600),
                )
              : SizedBox(),
          Text(
            message.text,
            style: TextStyle(
              fontSize: 16,
                color: message.isSender ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
