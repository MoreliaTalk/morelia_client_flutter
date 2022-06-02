import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:morelia_client_flutter/components/common/adaptive_menu.dart';
import 'package:morelia_client_flutter/modules/application_mode.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/models.dart';

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
              ],
              onChanged: (Object? value) {},
            ),
          ),
          const _AppModeSettingsWidget()
        ],
      ),
    );
  }
}

class _AppModeSettingsState extends StateNotifier<TypeApplicationMode?> {
  _AppModeSettingsState() : super(null) {
    var db = DatabaseHandler();

    db.dbConnect.applicationSettings.filter().keyEqualTo("appMode").watchLazy().listen((event) async {
      state = await db.getApplicationMode();
    });
  }
}

final _appModeSettingsState = StateNotifierProvider<_AppModeSettingsState, TypeApplicationMode?>((ref) => _AppModeSettingsState());

class _AppModeSettingsWidget extends ConsumerWidget {
  const _AppModeSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentValue = ref.watch(_appModeSettingsState);

    return ListTile(
      leading: Icon(Icons.devices_rounded),
      title: Text("Application platform mode"),
      trailing: DropdownButton<TypeApplicationMode?>(
        items: [
          DropdownMenuItem(
            value: null,
            child: Text("Real (${realPlatformMode.name[0].toUpperCase() + realPlatformMode.name.substring(1)})"),
          ),
          const DropdownMenuItem(
            value: TypeApplicationMode.desktop,
            child: Text("Desktop"),
          ),
          const DropdownMenuItem(
            value: TypeApplicationMode.mobile,
            child: Text("Mobile"),
          )
        ],
        value: currentValue,
        onChanged: (TypeApplicationMode? value) async {
          var db = DatabaseHandler();
          if (value != null) {
            await db.setApplicationMode(value);
          } else {
            await db.resetApplicationMode();
          }
        },
      ),
    );
  }
}
