// main chat screen
class ChatScreen extends StatelessWidget {
  final String userName;
  const ChatScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatHeader(userName: userName),
      body: Column(
        children: [
          Expanded(child: MessageList()),
          TypingIndicator(),
          MessageInputBar(),
        ],
      ),
    );
  }
}

// chat_header (resuable component)
class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  final String userName;

  ChatHeader({required this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(userName),
      actions: [
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// message_list
class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for message list
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => ChatBubble(message: 'Message #$index'),
    );
  }
}

// chat_bubble
class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(message),
      ),
    );
  }
}
