import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({required this.text, required this.onTap, Key? key}) : super(key: key);
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(text), onTap: onTap,);
  }

}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: List.generate(100, (index) => ListTile(title: Text("Setting"), onTap: () {}))
      ),
    );
  }
}
