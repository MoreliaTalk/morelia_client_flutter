import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/chat_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChatListState(),
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
                title: const Text("MoreliaTalk"),
                leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      var faker = Faker();
                      Provider.of<ChatListState>(context, listen: false)
                          .addChat(
                        faker.person.name(),
                        faker.lorem.sentence(),
                      );
                    }
                    // onPressed: () {},
                    )),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                bool isHorizontal = constraints.maxWidth > 500;
                if (isHorizontal) {
                  return (Row(children: [
                    const Expanded(flex: 3, child: ChatList()),
                    Expanded(flex: 6, child: Container()),
                  ]));
                } else {
                  return const ChatList();
                }
              },
            ),
          );
        });
  }
}
