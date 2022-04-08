import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:morelia_client_flutter/modules/db.dart';
import 'package:morelia_client_flutter/modules/router.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart'
    show currentTheme;

late DatabaseHandler DBHandler;

void main() async {
  DBHandler = DatabaseHandler.connect("");

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
