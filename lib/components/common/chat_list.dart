import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class ChatStateItem {
  ChatStateItem({required this.flow, required this.lastMessage});

  final models.Flow flow;
  final String lastMessage;
}

class ChatsStateNotifier extends StateNotifier<List<ChatStateItem?>> {
  ChatsStateNotifier() : super([]) {
    var dbHandlerInstance = DatabaseHandler.connect();

    Future.delayed(Duration.zero, () async {
      loadChats();
      (await dbHandlerInstance.dbConnect)
          .flows
          .watchLazy()
          .listen((event) async {
        loadChats();
      });
    });
  }

  Future<void> loadChats() async {
    var dbData = await DatabaseHandler.connect().getAllFlow();
    List<ChatStateItem?> newState = [];

    for (var flow in dbData) {
      await flow!.flowLinkedMessages.load();
      newState.add(ChatStateItem(
          flow: flow,
          lastMessage: (flow.flowLinkedMessages.isNotEmpty
              ? flow.flowLinkedMessages.last.text
              : "no messages") as String));
    }
    state = newState;
  }
}

final chatsStateProvider =
    StateNotifierProvider<ChatsStateNotifier, List<ChatStateItem?>>(
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
              var chat = chats[index];
              return ChatItem(
                  chat?.flow.title as String, chat?.lastMessage as String);
            }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var faker = Faker();
            final flowUuid = faker.guid.guid();
            final userUuid = faker.guid.guid();
            var dbHandlerInstance = DatabaseHandler.connect();
            await dbHandlerInstance.addUser(userUuid, "login", "hashPassword");
            await dbHandlerInstance.addFlow(flowUuid, userUuid, [userUuid],
                title: faker.person.name());
            await dbHandlerInstance.addMessage(
                flowUuid, userUuid, faker.guid.guid(), 123,
                text: "Hello!");
          },
        ));
  }
}
