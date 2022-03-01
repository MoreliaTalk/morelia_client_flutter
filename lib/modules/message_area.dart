import 'package:flutter/material.dart';


class Message extends StatelessWidget {
  const Message(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(this.text));
  }
}

class MessagePage extends StatelessWidget{
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: ListView(
          children: const [
            Message("Hello!")
          ],
        )
      )
    );
  }
}
