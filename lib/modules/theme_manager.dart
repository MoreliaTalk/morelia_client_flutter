import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/models.dart';

enum ThemeTypes {
  defaultLight,
  defaultDark
}

final themesData = {
  ThemeTypes.defaultDark: ThemeData.dark(),
  ThemeTypes.defaultLight: ThemeData.light()
};


class ThemeStateNotifier extends StateNotifier<ThemeTypes> {
  ThemeStateNotifier() : super(ThemeTypes.defaultDark) {
    Future.delayed(Duration.zero, () async {
      final db = DatabaseHandler();
      await loadAndSetTheme();
      (await db.dbConnect).applicationSettings.watchObject(1).listen((event) {
        loadAndSetTheme();
      });
    });
  }

  Future<void> loadAndSetTheme() async {
    final db = DatabaseHandler();
    var newTheme = await db.getTheme();

    newTheme ??= ThemeTypes.defaultDark;
    state = newTheme;
  }
}

final currentTheme = StateProvider<ThemeData>((ref) => ThemeData.dark());


class ThemeWidget extends ConsumerWidget {
  const ThemeWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(data: ref.watch(currentTheme), child: child);
  }
}
