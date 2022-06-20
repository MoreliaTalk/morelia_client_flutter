import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/chat_list.dart';
import '../desktop/vertical_menu_bar.dart';

final currentChatPage =
    StateProvider<Widget>((ref) => const Center(child: Text("Select chat")));

class DesktopMainPage extends ConsumerWidget {
  const DesktopMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: (Row(children: const [
        VerticalMenuBar(),
        Expanded(flex: 3, child: ChatList()),
        Expanded(flex: 6, child: AutoRouter())
      ])),
    );
  }
}
