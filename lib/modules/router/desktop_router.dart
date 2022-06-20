import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/common/communication_page.dart';
import '../../components/common/settings_page.dart';
import '../../components/desktop/main_page.dart';
import 'app_router.dart';

part 'desktop_router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: ThemeWrapper, path: "", initial: true, children: [
    AutoRoute(
        path: "",
        page: DesktopMainPage,
        initial: true,
        children: <AutoRoute>[
          AutoRoute(path: "chat/:uuid", page: CommunicationPage)
        ]),
    AutoRoute(
        path: "settings",
        page: SettingsPage,
        children: [AutoRoute(path: "personalize", page: PersonalizePage)])
  ])
])
class DesktopAppRouter extends _$DesktopAppRouter {}
