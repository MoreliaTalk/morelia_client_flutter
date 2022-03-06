import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MobileNavBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentSelected = useState(0);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      currentIndex: currentSelected.value,
      onTap: (index) => currentSelected.value = index,
    );
  }
}
