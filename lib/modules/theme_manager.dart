import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightTheme = ThemeData.light();
final darkTheme = ThemeData.dark();

final currentTheme = StateProvider<ThemeData>((ref) => darkTheme);
