import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/platform_const.dart';
import 'message_area.dart';

class ChatItem extends ConsumerWidget {
  const ChatItem(this.title, this.lastMessage, {Key? key}) : super(key: key);
  final String title;
  final String lastMessage;
  final String uuid = "";

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

class ChatListStateNotifier extends StateNotifier<List<ChatItem>> {
  ChatListStateNotifier() : super([]);

  addChat(String title, String lastMessage) {
    state = [...state, ChatItem(title, lastMessage)];
  }
}

final chatListStateProvider =
    StateNotifierProvider<ChatListStateNotifier, List<ChatItem>>(
        (ref) => ChatListStateNotifier());

final onClickItemsFunction = StateProvider<Function(String uuid)>(
  (ref) => (String uuid) {}
);

class ChatList extends ConsumerWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChatItem> chats = ref.watch(chatListStateProvider);
    return Container(
        child: (ListView.builder(
            controller: ScrollController(),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return chats[index];
            })));
  }
}
