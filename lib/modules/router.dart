import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart';

import '../components/common/communication_page.dart';
import '../components/common/settings_page.dart';
import '../components/desktop/main_page.dart';
import '../components/mobile/chats_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreliaRouter {
  get _routes {
    List<GoRoute> routes = [
      GoRoute(
          path: "/settings",
          builder: (context, _) => const SettingsPage(),
          routes: [])
    ];

    switch (currentPlatform) {
      case TypePlatformDevices.mobile:
        routes.addAll([
          GoRoute(path: "/", builder: (context, _) => const MobileChatsPage()),
          GoRoute(
              path: "/messages/:uuid",
              builder: (context, state) =>
                  CommunicationPage(uuid: state.params['uuid']!))
        ]);
        break;
      case TypePlatformDevices.desktop:
        routes.addAll([
          GoRoute(
              path: "/", builder: (context, state) => const DesktopMainPage())
        ]);
        break;
      default:
        routes = [
          GoRoute(
              path: "/",
              builder: (context, _) =>
                  const Text("Your platform is not supported"))
        ];
        break;
    }
    return routes;
  }

  get router {
    return GoRouter(
      routes: _routes,
      navigatorBuilder: (_, __, child) => ThemeStateWidget(child: child)
    );
  }
}
