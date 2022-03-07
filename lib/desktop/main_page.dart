import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/components/communication_page.dart';
import 'package:morelia_client_flutter/components/message_area.dart';
import 'package:morelia_client_flutter/mobile/chats_page.dart';

import '../components/chat_list.dart';

final currentChatPage =
    StateProvider<Widget>((ref) => const Center(child: Text("Select chat")));

class DesktopMainPage extends ConsumerWidget {
  const DesktopMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chats = ref.watch(chatListStateProvider.notifier);
    Future.delayed(
        Duration.zero,
        () => ref.watch(onClickItemsFunction.notifier).state = (String uuid) =>
            ref.watch(currentChatPage.notifier).state =
                CommunicationPage(uuid: uuid));
    return Scaffold(
      body: (Row(children: [
        const Expanded(flex: 3, child: ChatList()),
        Expanded(flex: 6, child: ref.watch(currentChatPage))
      ])),
    );
  }
}
