import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/components/message_area.dart';
import 'package:provider/provider.dart';

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
        if (isMobileDevice) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MessagePage(chatName: title)))
        } else if (isDesktopDevice) {

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

class ChatListState extends ChangeNotifier {
  List<ChatItem> chatWidgetsList = [];

  addChat(String title, String lastMessage) {
    chatWidgetsList.add(ChatItem(title, lastMessage));
    notifyListeners();
  }
}

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListState>(builder: (context, chatsState, child) {
      return Container(
          child: (ListView.builder(
              itemCount: chatsState.chatWidgetsList.length,
              itemBuilder: (context, index) {
                return chatsState.chatWidgetsList[index];
              })));
    });
  }
}
