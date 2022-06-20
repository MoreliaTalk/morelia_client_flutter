import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum _NavBarItems { Chats, Settings }

class MobileNavBar extends HookWidget {
  const MobileNavBar({Key? key}) : super(key: key);

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
        } else if (index == _NavBarItems.Settings.index) {}
        currentSelected.value = index;
      },
    );
  }
}
