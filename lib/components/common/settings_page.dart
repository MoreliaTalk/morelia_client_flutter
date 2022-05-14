import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/components/common/adaptive_menu.dart';
import 'package:morelia_client_flutter/modules/platform_const.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: AdaptiveMenu(
        mode: () {
          if (currentPlatform == TypePlatformDevices.desktop) {
            return AdaptiveMenuMode.split;
          } else {
            return AdaptiveMenuMode.fullscreen;
          }
        }(),
        menuFlexWidth: 1,
        subPageFlexWidth: 6,
        items: [
        AdaptiveMenuItem(
            widget: ListTile(
                leading: const Icon(Icons.palette),
                title: const Text("Color theme"),
                iconColor: Theme.of(context).colorScheme.primary),
            subPage: const Text("hello"))
      ]),
    );
  }
}
