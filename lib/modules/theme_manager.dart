import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.dark();

  void setTheme(ThemeData theme) {
    currentTheme = theme;
  }
}
