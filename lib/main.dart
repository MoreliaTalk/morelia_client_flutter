import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHandler().connect();
  runApp(const ProviderScope(child: MoreliaApp()));
}

class MoreliaApp extends ConsumerWidget {
  const MoreliaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterState);

    return MaterialApp.router(
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser());
  }
}
