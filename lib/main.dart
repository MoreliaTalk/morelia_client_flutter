import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/mobile/chats_page.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart'
    show currentTheme;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/desktop/main_page.dart';

void main() {
  runApp(const ProviderScope(child: MoreliaApp()));
}

class MoreliaApp extends ConsumerWidget {
  const MoreliaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget _screen;
    switch (currentPlatform) {
      case TypePlatformDevices.mobile:
        _screen = const MobileChatsPage();
        break;
      case TypePlatformDevices.desktop:
        _screen = const DesktopMainPage();
        break;
      case TypePlatformDevices.notSupported:
        _screen = const Center(child: Text("Sorry, your platform is not suported"));
        break;
    }
    return MaterialApp(theme: ref.watch(currentTheme), home: _screen);
  }
}
