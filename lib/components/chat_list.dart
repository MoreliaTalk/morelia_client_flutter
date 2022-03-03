import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/platform_const.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(this.title, this.lastMessage, {Key? key}) : super(key: key);
  final String title;
  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    String avatarSymbols = "";
    title.split(" ").forEach((value) {
      avatarSymbols += value[0];
    });

    return ListTile(
      onTap: () => {
        if (isMobileDevice)
          {
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessagePage(chatName: title))*)*/
          }
        else if (isDesktopDevice)
          {}
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
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return chats[index];
            })));
  }
}
