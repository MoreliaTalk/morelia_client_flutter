import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTheme = StateProvider<ThemeData>((ref) => ThemeData.dark());
