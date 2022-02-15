import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/modules/chat_list.dart' show ChatList;

void main() {
  runApp(const MyApp());
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
            onPressed: () => print("hello")
          )
        ),
        body: const ChatList()
      ),
    );
  }
}

