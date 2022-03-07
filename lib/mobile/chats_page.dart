import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:morelia_client_flutter/components/message_area.dart';
import 'package:morelia_client_flutter/mobile/mobile_nav_bar.dart';

import '../components/chat_list.dart';
import '../modules/platform_const.dart';

class MobileChatsPage extends ConsumerWidget {
  const MobileChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chats = ref.watch(chatListStateProvider.notifier);
    Future.delayed(
        Duration.zero,
        () => ref.watch(onClickItemsFunction.notifier).state = (String uuid) {
              GoRouter.of(context).push("/messages/" + uuid);
            });
    return Scaffold(
      body: const ChatList(),
      bottomNavigationBar: MobileNavBar(),
    );
  }
}
