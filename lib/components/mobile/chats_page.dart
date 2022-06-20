import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/chat_list.dart';
import '../mobile/mobile_nav_bar.dart';

class MobileChatsPage extends ConsumerWidget {
  const MobileChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ChatList(),
      bottomNavigationBar: MobileNavBar(),
    );
  }
}
