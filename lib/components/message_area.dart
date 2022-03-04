import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../modules/platform_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message extends StatelessWidget {
  const Message(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          color: Theme.of(context).colorScheme.primary,
          child: Text(this.text)
        );
  }
}


class MessagesStateNotifier extends StateNotifier<List<Message>> {
  MessagesStateNotifier() : super(<Message>[]);

  void setChat(String uuid) {
    // TODO: сделать загрузку сообщений из бд
    // этот кусок кода для демонтраци работы чата
    var faker = Faker();
    state = [];
    for (int i = 0; i < 10; i++) {
      state = [
        ...state,
        Message(faker.lorem.sentence()),
      ];
    }
  }
}

final messagesStateProvider = StateNotifierProvider<MessagesStateNotifier, List<Message>>((ref) => MessagesStateNotifier());

class MessageArea extends ConsumerWidget {
  const MessageArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Message> messagesList = ref.watch(messagesStateProvider);
    return ListView(
      children: messagesList,
    );
  }
}


class MessagePage extends ConsumerWidget {
  const MessagePage({required this.chatName, Key? key}) : super(key: key);
  final String chatName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var messagesList = ref.watch(messagesStateProvider.notifier);
    messagesList.setChat("123");
    return Scaffold(
        appBar: AppBar(
          title: Text(chatName),
        ),
        body: const MessageArea());
  }
}
