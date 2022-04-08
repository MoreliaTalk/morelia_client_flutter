import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:morelia_client_flutter/main.dart';
import 'package:morelia_client_flutter/modules/db.dart';
import 'package:path_provider/path_provider.dart';
import '../../modules/models.dart' as models;

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

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db_connection.flows.watchLazy(),
        builder: (context, _) {
          return FutureBuilder<List<models.Flow?>>(
              future: DBHandler.getAllFlow(),
              builder: (context, snapshot) => Scaffold(
                    body: Container(
                        child: (ListView.builder(
                            controller: ScrollController(),
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              if (snapshot.data != null) {
                                return ChatItem(snapshot.data![index]?.title as String, snapshot.data![index]?.uuid as String);
                              } else {
                                return const Center(child: Text("Chats not found"));
                              }
                            }))),
                    floatingActionButton: FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () async {
                        var faker = Faker();
                        DBHandler.addFlow(faker.guid.guid(), [], title: faker.person.name());
                      },
                    ),
                  ));
        });
  }
}
