import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart';

import '../components/common/communication_page.dart';
import '../components/common/settings_page.dart';
import '../components/desktop/main_page.dart';
import '../components/mobile/chats_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mobileRoutes = [
  GoRoute(path: "/", builder: (context, _) => const MobileChatsPage()),
  GoRoute(
      path: "/messages/:uuid",
      builder: (context, state) =>
          CommunicationPage(uuid: state.params['uuid']!)),
  GoRoute(
      path: "/settings",
      builder: (context, _) => const SettingsPage(),
      routes: [])
];

final desktopRoutes = [
  GoRoute(path: "/", builder: (context, state) => const DesktopMainPage()),
  GoRoute(
      path: "/settings",
      builder: (context, _) => const SettingsPage(),
      routes: [])
];

class MoreliaRouter {
  get _routes => () {
    switch (currentPlatform) {
      case TypePlatformDevices.mobile:
        return mobileRoutes;
      case TypePlatformDevices.desktop:
        return desktopRoutes;
      default:
        return [
          GoRoute(
              path: "/",
              builder: (context, _) =>
              const Text("Your platform is not supported"))
        ];
    }
  };

  get router {
    return GoRouter(
      routes: _routes,
      navigatorBuilder: (_, __, child) => ThemeStateWidget(child: child)
    );
  }
}
