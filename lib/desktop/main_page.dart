import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/components/message_area.dart';
import 'package:morelia_client_flutter/mobile/chats_page.dart';

import '../components/chat_list.dart';

class DesktopMainPage extends ConsumerWidget {
  const DesktopMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chats = ref.watch(chatListStateProvider.notifier);
    return Scaffold(
        appBar: AppBar(
            title: const Text("MoreliaTalk"),
            leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  var faker = Faker();
                  chats.addChat(
                    faker.person.name(),
                    faker.lorem.sentence(),
                  );
                })),
        body: (Row(children: const [
          Expanded(flex: 3, child: ChatList()),
          Expanded(flex: 6, child: MessageArea()),
        ])),
      );
  }
}
