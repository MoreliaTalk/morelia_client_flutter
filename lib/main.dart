import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart'
    show currentTheme;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/screens/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MoreliaApp()));
}

class MoreliaApp extends ConsumerWidget {
  const MoreliaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(theme: ref.watch(currentTheme), home: const MainPage());
  }
}
