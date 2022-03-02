import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/components/chat_list.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart' show ThemeState;
import 'package:morelia_client_flutter/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeState(),
        child: const MoreliaApp()
      )
  );
}

class MoreliaApp extends StatelessWidget {
  const MoreliaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
        builder: (context, themeState, child) {
          return MaterialApp(
              theme: themeState.currentTheme,
              home: const MainPage()
          );
        }
    );
  }
}

