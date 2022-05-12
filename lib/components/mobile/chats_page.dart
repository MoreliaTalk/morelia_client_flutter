import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/chat_list.dart';
import '../mobile/mobile_nav_bar.dart';

class MobileChatsPage extends ConsumerWidget {
  const MobileChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
