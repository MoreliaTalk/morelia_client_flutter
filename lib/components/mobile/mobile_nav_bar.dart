import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MobileNavBar extends StatelessWidget {
  MobileNavBar({Key? key, required this.tabsRouter}) : super(key: key);

  TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) {
          tabsRouter.setActiveIndex(index);
        },
      );
  }
}



