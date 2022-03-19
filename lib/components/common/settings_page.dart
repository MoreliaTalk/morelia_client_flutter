import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart';

GoRoute settingsRoute = GoRoute(
    path: "/settings",
    builder: (context, _) => const SettingsPage(),
    routes: []);

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = ref.watch(currentTheme.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(children: [
        ListTile(
          title: const Text("Color theme"),
          trailing: DropdownButton<String>(
            items: [
              DropdownMenuItem(
                child: const Text("Dark Theme"),
                value: "Dark Theme",
                onTap: () {
                  theme.state = ThemeData.dark();
                },
              ),
              DropdownMenuItem(
                child: const Text("Light Theme"),
                value: "Light Theme",
                onTap: () {
                  theme.state = ThemeData.light();
                },
              )
            ],
            onChanged: (Object? value) {},
          ),
        )
      ]),
    );
  }
}
