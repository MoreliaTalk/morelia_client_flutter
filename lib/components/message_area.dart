import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart';

import '../modules/platform_const.dart';

class Message extends StatelessWidget {
  const Message(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(this.text));
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({required this.chatName, Key? key}) : super(key: key);
  final String chatName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(chatName),
        ),
        body: ListView(
          children: const [
            Message("Hello!")
          ],
        )
    );
  }
}
