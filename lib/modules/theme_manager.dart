import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightTheme = ThemeData.light()
final darkTheme = ThemeData.dark();

final currentTheme = StateProvider<ThemeData>((ref) => darkTheme);

class ThemeWidget extends ConsumerWidget {
  const ThemeWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(data: ref.watch(currentTheme), child: child);
  }
}
