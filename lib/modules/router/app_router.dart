import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/application_mode.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/router/mobile_router.dart';
import '../theme_manager.dart';
import 'desktop_router.dart';

final appRouterState = Provider((ref) {
  switch (ref.watch(applicationMode)) {
    case TypeApplicationMode.desktop:
      return DesktopAppRouter();
    case TypeApplicationMode.mobile:
      return MobileAppRouter();
  }
});

class ThemeWrapper extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return const ThemeWidget(child: AutoRouter());
  }

  @override
  Widget build(BuildContext context) => Container();
}

/*
class MoreliaRouter extends ConsumerWidget {
  final mobileRoutes = [
    GoRoute(path: "/", builder: (context, _) => const MobileChatsPage()),
    GoRoute(
        path: "/messages/:uuid",
        builder: (context, state) =>
            CommunicationPage(uuid: state.params['uuid']!)),
    GoRoute(
        path: "/settings",
        builder: (context, _) => const Scaffold(
          body: SettingsPage(),
          bottomNavigationBar: MobileNavBar(),
        ),
        routes: [])
  ];

  final desktopRoutes = [
    GoRoute(path: "/", builder: (context, state) => const DesktopMainPage()),
    GoRoute(
        path: "/settings",
        builder: (context, _) => const SettingsPage(),
        routes: [])
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late List<GoRoute> routes;

    switch (ref.watch(applicationMode)) {
      case TypeApplicationMode.mobile:
        routes = mobileRoutes;
        break;
      case TypeApplicationMode.desktop:
        routes = desktopRoutes;
        break;
    }

    var router = GoRouter(
        routes: routes,
        navigatorBuilder: (_, __, child) => ThemeWidget(child: child));

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
*/
