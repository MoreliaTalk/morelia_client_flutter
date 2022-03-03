import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/chat_list.dart';
import '../modules/platform_const.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    if (isMobileDevice) {
      return Scaffold(
        appBar: AppBar(
            title: const Text("MoreliaTalk"),
            leading:
                IconButton(icon: const Icon(Icons.menu), onPressed: () {})),
        body: const ChatList(),
      );
    } else if (isDesktopDevice) {
      return Scaffold(
        body: (Row(children: [
          const Expanded(flex: 3, child: ChatList()),
          Expanded(flex: 6, child: Container()),
        ])),
      );
    } else {
      return const Text("Your platform is not supported");
    }
  }
}
