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
