import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/chat_list.dart';
import '../common/communication_page.dart';
import '../desktop/vertical_menu_bar.dart';

final currentChatPage =
    StateProvider<Widget>((ref) => const Center(child: Text("Select chat")));

class DesktopMainPage extends ConsumerWidget {
  const DesktopMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
        Duration.zero,
        () => ref.watch(onClickItemsFunction.notifier).state = (String uuid) =>
            ref.watch(currentChatPage.notifier).state =
                CommunicationPage(uuid: uuid));
    return Scaffold(
      body: (Row(children: [
        const VerticalMenuBar(),
        const Expanded(flex: 3, child: ChatList()),
        Expanded(flex: 6, child: ref.watch(currentChatPage))
      ])),
    );
  }
}
