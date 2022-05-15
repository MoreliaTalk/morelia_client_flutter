import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum TypesMessages { my, otherUser }

class Message extends StatelessWidget {
  const Message(
      {required this.messageText, required this.messageType, Key? key})
      : super(key: key);
  final String messageText;
  final TypesMessages messageType;

  @override
  Widget build(BuildContext context) {
    late Alignment alig;
    late BorderRadius borderRad;
    late Color backgroundColor;
    late Color textColor;

    if (messageType == TypesMessages.my) {
      alig = Alignment.centerRight;
      borderRad = const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(3),
      );
      backgroundColor = Theme.of(context).colorScheme.primary;
    } else if (messageType == TypesMessages.otherUser) {
      alig = Alignment.centerLeft;
      borderRad = const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(3),
        bottomRight: Radius.circular(10),
      );
      backgroundColor = Theme.of(context).colorScheme.secondary;
    }

    if (HSLColor.fromColor(backgroundColor).lightness > 0.4) {
      textColor = Colors.black;
    } else {
      textColor = Colors.white;
    }

    return Align(
        alignment: alig,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRad,
              color: backgroundColor,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Text(
              messageText,
              style: TextStyle(color: textColor),
            )));
  }
}

class MessageArea extends ConsumerWidget {
  const MessageArea({required this.messagesList, Key? key}) : super(key: key);
  final List<Message> messagesList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      controller: ScrollController(),
      itemCount: messagesList.length,
      itemBuilder: (context, index) => messagesList[index],
    );
  }
}
