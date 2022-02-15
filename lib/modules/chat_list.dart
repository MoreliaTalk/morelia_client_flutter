import 'package:flutter/material.dart';

class Chat{
  late String title;
  String? lastMessage;
}

class ChatList extends StatefulWidget{
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatList createState() => _ChatList();
}

class _ChatList extends State{
  List<Chat> chats = [
    Chat()
      ..title = "Hello"
      ..lastMessage = "World"
  ];

  @override
  Widget build(BuildContext context){
    List<Widget> chat_widgets = [];
    for (var chat in chats){
      chat_widgets.add(Container(
        child: Row(children: [Text(chat.title), Text(chat.title)],),
      ));
    }
    return ListView(
      children: chat_widgets,
    );
  }
}