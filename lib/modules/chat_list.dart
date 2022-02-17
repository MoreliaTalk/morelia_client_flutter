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
      builder: (context, chats_state, child) {
        return ListView.builder(
          itemCount: chats_state.chatWidgetsList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: chats_state.chatWidgetsList[index]
            );
          }
        );
      }
    );
  }
}
