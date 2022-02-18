import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/modules/chat_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => ChatListState(),
        child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MoreliaTalk"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Provider.of<ChatListState>(context, listen: false).addChat(
              "Hello",
              "World",
            )
            // onPressed: () {},
          )
        ),
        body: const ChatList()
      ),
    );
  }
}

