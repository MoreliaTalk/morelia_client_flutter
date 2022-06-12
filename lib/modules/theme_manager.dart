import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/models.dart';

enum ThemeTypes { defaultLight, defaultDark }

final themesData = {
  ThemeTypes.defaultDark: ThemeData.dark(),
  ThemeTypes.defaultLight: ThemeData.light()
};

final currentTheme = StateProvider<ThemeData>((ref) {
  var themeInDb = ref.watch(DatabaseHandler().themeState);

  return themesData[themeInDb]!;
});

class ThemeWidget extends ConsumerWidget {
  const ThemeWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(data: ref.watch(currentTheme), child: child);
  }
}
