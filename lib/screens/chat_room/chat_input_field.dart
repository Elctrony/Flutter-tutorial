import 'dart:convert';

import 'package:flutter_tutorial/modal/ChatMessage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


import '../../utility/constants.dart';

class ChatInputField extends StatefulWidget {
  ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {
                              print('Gallery');
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              print(file!.path);
                              final image = Image.file(File(file.path));
                              print('image:${image}');
                              print('height:${image.height}');
                              final message = ChatMessage(
                                  messageType: 1,
                                  isSender: true,
                                  imageUrl: file.path);

                              Provider.of<ChatMessages>(context, listen: false)
                                  .addMessage(message);
                            },
                            icon: Icon(
                              Icons.attach_file,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                          )
                        : SizedBox(),
                    messageController.text.isEmpty
                        ? SizedBox(width: kDefaultPadding / 4)
                        : SizedBox(),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {
                              print('Camera');
                              XFile? file = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              print(file!.path);
                              final image = Image.file(File(file.path));
                              print('width:${image.width}');
                              print('height:${image.height}');
                              final message = ChatMessage(
                                  messageType: 1,
                                  isSender: true,
                                  imageUrl: file.path);
                              Provider.of<ChatMessages>(context, listen: false)
                                  .addMessage(message);
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                          )
                        : SizedBox(),
                    messageController.text.isNotEmpty
                        ? SizedBox(width: kDefaultPadding / 4)
                        : SizedBox(),
                    messageController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () async{
                              final message = ChatMessage(
                                  messageType: 0,
                                  isSender: true,
                                  text: messageController.text);
                              messageController.clear();
                              Provider.of<ChatMessages>(context, listen: false)
                                  .addMessage(message);
                            },
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
