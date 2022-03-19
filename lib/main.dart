import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:morelia_client_flutter/components/common/settings_page.dart';
import 'package:morelia_client_flutter/components/desktop/main_page.dart';
import 'package:morelia_client_flutter/components/mobile/chats_page.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';
import 'package:morelia_client_flutter/modules/router.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart'
    show currentTheme;

import 'components/common/communication_page.dart';

void main() {
  runApp(const ProviderScope(child: MoreliaApp()));
}

class MoreliaApp extends ConsumerWidget {
  const MoreliaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter _router = MoreliaRouter().router;

    return MaterialApp.router(
      theme: ref.watch(currentTheme),
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
