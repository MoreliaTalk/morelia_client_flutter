import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/components/message_area.dart';
import 'package:morelia_client_flutter/components/mobile_nav_bar.dart';

import '../components/chat_list.dart';
import '../modules/platform_const.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chats = ref.watch(chatListStateProvider.notifier);
    if (isMobileDevice) {
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
        body: const ChatList(),
        bottomNavigationBar: MobileNavBar(),
      );
    } else if (isDesktopDevice) {
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
    } else {
      return const Text("Your platform is not supported");
    }
  }
}
