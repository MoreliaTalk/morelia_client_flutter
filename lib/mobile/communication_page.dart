import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/message_area.dart';
/*
class MessagesStateNotifier extends StateNotifier<List<Message>> {
  MessagesStateNotifier() : super(<Message>[]);

  void setChat(String uuid) {
    // TODO: сделать загрузку сообщений из бд
    // этот кусок кода для демонтраци работы чата
    var faker = Faker();
    state = [];
    for (int i = 0; i < 30; i++) {
      TypesMessages type;
      if (i % 2 > 0) {
        type = TypesMessages.my;
      } else {
        type = TypesMessages.otherUser;
      }

      state = [
        ...state,
        Message(faker.lorem.sentence(), type),
      ];
    }
  }
}

final messagesStateProvider =
    StateNotifierProvider<MessagesStateNotifier, List<Message>>(
        (ref) => MessagesStateNotifier());*/

class CommunicationPage extends ConsumerWidget {
  const CommunicationPage({required this.uuid, Key? key}) : super(key: key);
  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("chatName"),
        ),
        body: const MessageArea(
          messagesList: [Message("faker.lorem.sentence()", TypesMessages.my)],
        ));
  }
}
