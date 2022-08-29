import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/application_mode.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: Row(children: [
          Expanded(
            flex: 1,
            child: ListView(children: [
              ListTile(
                leading: const Icon(Icons.palette),
                title: const Text("Personalization"),
                iconColor: Theme.of(context).colorScheme.primary,
                onTap: () {
                  context.router.navigateNamed("personalize");
                },
              )
            ]),
          ),
          const Expanded(
            flex: 5,
            child: AutoRouter(),
          )
        ]));
  }
}

class PersonalizePage extends ConsumerWidget {
  const PersonalizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: const [_ThemeSettingsWidget(), _AppModeSettingsWidget()],
      ),
    );
  }
}

class _ThemeSettingsWidget extends ConsumerWidget {
  const _ThemeSettingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentValue = ref.watch(DatabaseHandler().themeState);

    return ListTile(
      leading: const Icon(Icons.palette_outlined),
      title: const Text("Color Theme"),
      trailing: DropdownButton<ThemeTypes>(
        items: const [
          DropdownMenuItem(
            value: ThemeTypes.defaultLight,
            child: Text("Light"),
          ),
          DropdownMenuItem(
            value: ThemeTypes.defaultDark,
            child: Text("Dark"),
          )
        ],
        value: currentValue,
        onChanged: (ThemeTypes? value) async {
          await DatabaseHandler().setTheme(value!);
        },
      ),
    );
  }
}

class _AppModeSettingsWidget extends ConsumerWidget {
  const _AppModeSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentValue = ref.watch(DatabaseHandler().appModeState);

    return ListTile(
      leading: const Icon(Icons.devices_rounded),
      title: const Text("Application platform mode"),
      trailing: DropdownButton<TypeApplicationMode?>(
        items: [
          DropdownMenuItem(
            value: null,
            child: Text(
                "Real (${realPlatformMode.name[0].toUpperCase() + realPlatformMode.name.substring(1)})"),
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
