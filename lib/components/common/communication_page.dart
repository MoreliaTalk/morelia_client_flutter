import 'package:auto_route/annotations.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'message_area.dart';

class CommunicationPage extends ConsumerWidget {
  const CommunicationPage({@PathParam('uuid') this.uuid, Key? key})
      : super(key: key);
  final String? uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: сделать загрузку сообщений из бд
    // этот кусок кода для демонтраци работы чата
    var faker = Faker();
    List<Message> state = [];
    for (int i = 0; i < 30; i++) {
      TypesMessages newMessageType;
      if (i % 2 > 0) {
        newMessageType = TypesMessages.my;
      } else {
        newMessageType = TypesMessages.otherUser;
      }

      state = [
        ...state,
        Message(
            messageText: faker.lorem.sentence(), messageType: newMessageType),
      ];
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("chatName"),
        ),
        body: MessageArea(
          messagesList: state,
        ));
  }
}
