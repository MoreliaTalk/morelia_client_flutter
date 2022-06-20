// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'mobile_router.dart';

class _$MobileAppRouter extends RootStackRouter {
  _$MobileAppRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ThemeWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: ThemeWrapper()));
    },
    MobileChatsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MobileChatsPage());
    },
    CommunicationPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CommunicationPageRouteArgs>(
          orElse: () =>
              CommunicationPageRouteArgs(uuid: pathParams.optString('uuid')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CommunicationPage(uuid: args.uuid, key: args.key));
    },
    SettingsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    PersonalizePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PersonalizePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect', path: '/', redirectTo: '', fullMatch: true),
        RouteConfig(ThemeWrapperRoute.name, path: '', children: [
          RouteConfig(MobileChatsPageRoute.name,
              path: '', parent: ThemeWrapperRoute.name),
          RouteConfig(CommunicationPageRoute.name,
              path: 'chat/:uuid', parent: ThemeWrapperRoute.name),
          RouteConfig(SettingsPageRoute.name,
              path: 'settings',
              parent: ThemeWrapperRoute.name,
              children: [
                RouteConfig(PersonalizePageRoute.name,
                    path: 'personalize', parent: SettingsPageRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [ThemeWrapper]
class ThemeWrapperRoute extends PageRouteInfo<void> {
  const ThemeWrapperRoute({List<PageRouteInfo>? children})
      : super(ThemeWrapperRoute.name, path: '', initialChildren: children);

  static const String name = 'ThemeWrapperRoute';
}

/// generated route for
/// [MobileChatsPage]
class MobileChatsPageRoute extends PageRouteInfo<void> {
  const MobileChatsPageRoute() : super(MobileChatsPageRoute.name, path: '');

  static const String name = 'MobileChatsPageRoute';
}

/// generated route for
/// [CommunicationPage]
class CommunicationPageRoute extends PageRouteInfo<CommunicationPageRouteArgs> {
  CommunicationPageRoute({String? uuid, Key? key})
      : super(CommunicationPageRoute.name,
            path: 'chat/:uuid',
            args: CommunicationPageRouteArgs(uuid: uuid, key: key),
            rawPathParams: {'uuid': uuid});

  static const String name = 'CommunicationPageRoute';
}

class CommunicationPageRouteArgs {
  const CommunicationPageRouteArgs({this.uuid, this.key});

  final String? uuid;

  final Key? key;

  @override
  String toString() {
    return 'CommunicationPageRouteArgs{uuid: $uuid, key: $key}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute({List<PageRouteInfo>? children})
      : super(SettingsPageRoute.name,
            path: 'settings', initialChildren: children);

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [PersonalizePage]
class PersonalizePageRoute extends PageRouteInfo<void> {
  const PersonalizePageRoute()
      : super(PersonalizePageRoute.name, path: 'personalize');

  static const String name = 'PersonalizePageRoute';
}
