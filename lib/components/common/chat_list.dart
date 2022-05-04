import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morelia_client_flutter/main.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';

import '../../modules/database/models.dart' as models;

class ChatItem extends ConsumerWidget {
  const ChatItem(this.title, this.lastMessage, {Key? key}) : super(key: key);
  final String title;
  final String lastMessage;
  final String uuid = "123";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String avatarSymbols = "";
    title.split(" ").forEach((value) {
      avatarSymbols += value[0];
    });

    Function(String uuid) onClick = ref.watch(onClickItemsFunction);
    return ListTile(
      onTap: () => onClick(uuid),
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        radius: 22,
        child: Text(avatarSymbols),
      ),
      title: Text(title),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      minVerticalPadding: 10,
    );
  }
}

final onClickItemsFunction =
    StateProvider<Function(String uuid)>((ref) => (String uuid) {});

class ChatsStateNotifier extends StateNotifier<List<models.Flow?>> {
  ChatsStateNotifier() : super([]) {
    var dbHandlerInstance = DatabaseHandler.connect("");

    Future.delayed(Duration.zero, () async {
      state = await dbHandlerInstance.getAllFlow();
      (await dbHandlerInstance.dbConnect)
          .flows
          .watchLazy()
          .listen((event) async {
        state = await dbHandlerInstance.getAllFlow();
      });
    });
  }
}

final chatsStateProvider =
    StateNotifierProvider<ChatsStateNotifier, List<models.Flow?>>(
        (ref) => ChatsStateNotifier());

class ChatList extends ConsumerWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chats = ref.watch(chatsStateProvider);

    return Scaffold(
        body: ListView.builder(
            controller: ScrollController(),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ChatItem(chats[index]?.title as String, "Hello");
            }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var faker = Faker();
            final uuid = faker.guid.guid();
            var dbHandlerInstance = DatabaseHandler.connect("");
            await dbHandlerInstance.addUser(uuid, "login", "hashPassword");
            await dbHandlerInstance.addFlow(uuid, uuid, [uuid], title: faker.person.firstName());
            await dbHandlerInstance.addMessage(
                uuid, faker.guid.guid(), faker.guid.guid(), 123,
                text: "Hello!");
          },
        ));
  }
}

/*
        f,*/
