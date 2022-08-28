import 'package:flutter/cupertino.dart';



class ChatMessage {
  final String text;
  final int messageType;
  final bool isSender;
  final String? sender;
  final String? senderImage;
  final String? imageUrl;

  ChatMessage({
    this.text = '',
    required this.messageType,
    required this.isSender,
    this.sender,
    this.senderImage,
    this.imageUrl,
  });
}
class ChatMessages with ChangeNotifier{
  List<ChatMessage> _chatMessages = [
    ChatMessage(
        text: "Hi Sajol,",
        messageType: 0,
        isSender: false,
        senderImage: 'assets/images/user.png',
        sender: "Jenny Wilson"
    ),
    ChatMessage(
      text: "Hello, How are you?",
      messageType: 0,
      isSender: true,

    ),
    ChatMessage(
      text: "Hello, guys",
      messageType: 0,
      isSender: false,
      senderImage: 'assets/images/user_2.png',
      sender: "Ralph Edwards",

    ),
    ChatMessage(
      text: "Error happend",
      messageType: 0,
      isSender: false,
      senderImage: 'assets/images/user_3.png',
      sender: "Jacob Jones",

    ),
    ChatMessage(
        text: "This looks great man!!",
        messageType: 0,
        isSender: false,
        senderImage: 'assets/images/user_4.png',
        sender: "Albert Flores"
    ),
    ChatMessage(
      text: "Glad you like it",
      messageType: 0,
      isSender: false,
      senderImage: 'assets/images/user_5.png',
      sender: "Esther Howard",
    ),

  ];

  void addMessage(ChatMessage message){
    _chatMessages.add(message);
    notifyListeners();
  }

  List<ChatMessage> get getMessageList =>
     _chatMessages;
}

