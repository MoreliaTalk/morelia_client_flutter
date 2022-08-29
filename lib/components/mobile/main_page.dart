import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../modules/router/mobile_router.dart';
import '../common/chat_list.dart';
import '../mobile/mobile_nav_bar.dart';

class MobileChatsPage extends ConsumerWidget {
  const MobileChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: ChatList());
  }
}

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [MobileChatsPageRoute(), SettingsPageRoute()],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
              body: FadeTransition(
                opacity: animation,
                child: child,
              ),
              bottomNavigationBar: MobileNavBar(tabsRouter: tabsRouter)
          );
        }
    );
  }
}