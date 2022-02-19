import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/modules/chat_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => ChatListState(),
        child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MoreliaTalk"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              var faker = Faker();
              Provider.of<ChatListState>(context, listen: false).addChat(
                faker.person.name(),
                faker.lorem.sentence(),
              );
            }
            // onPressed: () {},
          )
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints ) {
            bool isHorizontal = constraints.maxWidth > 500;
            if (isHorizontal) {
              return (
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: ChatList()
                    ),
                    Expanded(flex: 6, child: Container()),
                  ]
                )
              );
            } else {
              return ChatList();
            }
          },
        ),
      ),
    );
  }
}

