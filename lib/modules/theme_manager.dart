import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';

enum TypeTheme {
  defaultLight,
  defaultDark
}

final themesData = {
  TypeTheme.defaultDark: ThemeData.dark(),
  TypeTheme.defaultLight: ThemeData.light()
};


class ThemeStateNotifier extends StateNotifier<TypeTheme> {
  ThemeStateNotifier() : super(TypeTheme.defaultDark) {
    Future.delayed(Duration.zero, () async {
      final db = DatabaseHandler.connect();
    });
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
