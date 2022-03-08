import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:morelia_client_flutter/desktop/main_page.dart';
import 'package:morelia_client_flutter/mobile/chats_page.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart'
    show currentTheme;

import 'components/communication_page.dart';

void main() {
  runApp(const ProviderScope(child: MoreliaApp()));
}

class MoreliaApp extends ConsumerWidget {
  const MoreliaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter _router;
    switch (currentPlatform) {
      case TypePlatformDevices.mobile:
        _router = GoRouter(routes: [
          GoRoute(
              path: "/", builder: (context, state) => const MobileChatsPage()),
          GoRoute(
              path: "/messages/:uuid",
              builder: (context, state) =>
                  CommunicationPage(uuid: state.params['uuid']!))
        ]);
        break;
      case TypePlatformDevices.desktop:
        _router = GoRouter(routes: [
          GoRoute(
              path: "/", builder: (context, state) => const DesktopMainPage())
        ]);
        break;
      case TypePlatformDevices.notSupported:
        return const Center(
            child: Text("Sorry, your platform is not suported"));
    }
    return MaterialApp.router(
      theme: ref.watch(currentTheme),
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
