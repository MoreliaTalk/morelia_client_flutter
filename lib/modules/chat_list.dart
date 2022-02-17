import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatListState extends ChangeNotifier{
  List<Widget> chatWidgetsList = [];

  void addChat(){
    chatWidgetsList.add(const Text("Hello"));
    notifyListeners();
  }
}

class ChatList extends StatelessWidget{
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListState>(
      builder: (context, chat, child) {
        return Column(
          children: chat.chatWidgetsList,
        );
      }
    );
  }
}
