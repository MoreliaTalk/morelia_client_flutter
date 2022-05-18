import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/components/common/adaptive_menu.dart';
import 'package:morelia_client_flutter/modules/application_mode.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: AdaptiveMenu(
          mode: (ref.watch(applicationMode) == TypeApplicationMode.desktop
              ? AdaptiveMenuMode.split
              : AdaptiveMenuMode.fullscreen),
          menuFlexWidth: 1,
          subPageFlexWidth: 5,
          items: [
            AdaptiveMenuItem(
                widget: ListTile(
                    leading: const Icon(Icons.palette),
                    title: const Text("Personalization"),
                    iconColor: Theme.of(context).colorScheme.primary),
                subPage: const PersonalizePage(),
                subPageText: const Text("Personalize"))
          ]),
    );
  }
}

class PersonalizePage extends ConsumerWidget {
  const PersonalizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text("Color Theme"),
            trailing: DropdownButton<String>(
                items: const [
                  DropdownMenuItem(
                    value: "",
                    child: Text("Light"),
                  ),
                  DropdownMenuItem(
                    value: "",
                    child: Text("Dark"),
                  )
                ], onChanged: (Object? value) {  },
            ),
          ),
          ListTile(
            leading: Icon(Icons.devices_rounded),
            title: Text("Application platform mode"),
            trailing: DropdownButton<TypeApplicationMode>(
              items: const [
                DropdownMenuItem(
                  value: TypeApplicationMode.desktop,
                  child: Text("Desktop"),
                ),
                DropdownMenuItem(
                  value: TypeApplicationMode.mobile,
                  child: Text("Mobile"),
                )
              ],
              value: ref.watch(applicationMode),
              onChanged: (TypeApplicationMode? value) async {
                var db = DatabaseHandler.connect();
                await db.setApplicationMode(value!);
              },
            ),
          ),
        ],
      ),
    );
  }

}
