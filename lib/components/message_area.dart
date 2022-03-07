import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../modules/platform_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TypesMessages { my, otherUser }

class Message extends StatelessWidget {
  const Message(this.text, this.type, {Key? key}) : super(key: key);
  final String text;
  final TypesMessages type;

  @override
  Widget build(BuildContext context) {
    late Alignment alig;
    late BorderRadius borderRad;
    late Color backgroundColor;
    late Color textColor;

    if (this.type == TypesMessages.my) {
      alig = Alignment.centerRight;
      borderRad = const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(3));
      backgroundColor = Theme.of(context).colorScheme.primary;
    } else if (this.type == TypesMessages.otherUser) {
      alig = Alignment.centerLeft;
      borderRad = const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(3),
          bottomRight: Radius.circular(10));
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
              this.text,
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
