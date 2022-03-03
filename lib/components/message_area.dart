import 'package:flutter/material.dart';
import '../modules/platform_const.dart';

class Message extends StatelessWidget {
  const Message(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(this.text));
  }
}

class MessageArea extends StatelessWidget {
  const MessageArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [Message("Hello!")],
    );
  }
}

class MessagePageState extends ChangeNotifier {
  late String currentChatUUID;
  List<Message> messages = [];

  void setChat(String uuid) {
    currentChatUUID = uuid;
    notifyListeners();
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
        body: const MessageArea());
  }
}
