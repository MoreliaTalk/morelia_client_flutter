import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

enum _NavBarItems { Chats, Settings }

class MobileNavBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentSelected = useState(0);
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.chat), label: _NavBarItems.Chats.name),
        BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: _NavBarItems.Settings.name),
      ],
      currentIndex: currentSelected.value,
      onTap: (index) {
        if (index == _NavBarItems.Chats.index) {
          GoRouter.of(context).go("/");
        } else if (index == _NavBarItems.Settings.index) {
          GoRouter.of(context).go("/settings");
        }
        currentSelected.value = index;
      },
    );
  }
}
