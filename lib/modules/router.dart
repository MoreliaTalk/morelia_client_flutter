import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';

import '../components/common/communication_page.dart';
import '../components/common/settings_page.dart';
import '../components/desktop/main_page.dart';
import '../components/mobile/chats_page.dart';


class MoreliaRouter {
  get router {
    switch (currentPlatform) {
      case TypePlatformDevices.mobile:
        return _mobileRouter;
      case TypePlatformDevices.desktop:
        return _desktopRouter;
      default:
        return GoRouter(routes: [GoRoute(path: "/", builder: (context, _) => const Text("Your platform is not supported"))]);
    }
  }

  final _mobileRouter = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, _) => const MobileChatsPage()),
    GoRoute(
        path: "/messages/:uuid",
        builder: (context, state) =>
            CommunicationPage(uuid: state.params['uuid']!))
  ]);

  final _desktopRouter = GoRouter(routes: [
    GoRoute(
        path: "/", builder: (context, state) => const DesktopMainPage()),
    settingsRoute
  ]);
}
