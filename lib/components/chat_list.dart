import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/platform_const.dart';
import 'message_area.dart';

class ChatItem extends ConsumerWidget {
  const ChatItem(this.title, this.lastMessage, {Key? key}) : super(key: key);
  final String title;
  final String lastMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String avatarSymbols = "";
    title.split(" ").forEach((value) {
      avatarSymbols += value[0];
    });

    return ListTile(
      onTap: () => {
        if (isMobileDevice)
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessagePage(chatName: title)))
          }
        else if (isDesktopDevice)
          {
            ref.watch(messagesStateProvider.notifier).setChat("123")
          }
      },
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
