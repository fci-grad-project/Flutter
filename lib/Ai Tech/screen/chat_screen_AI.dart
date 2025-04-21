import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:graduation_project/Ai%20Tech/model/chat_service.dart';
import 'package:graduation_project/Ai%20Tech/widgets/chat_avatar_builder.dart';
import 'package:graduation_project/Ai%20Tech/widgets/chat_input_bar.dart';

class ChatScreenAI extends StatefulWidget {
  @override
  _ChatScreenAIState createState() => _ChatScreenAIState();
}

class _ChatScreenAIState extends State<ChatScreenAI> {
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          Chat(
            messages: _chatService.chatMessages,
            onSendPressed: (message) =>
                _chatService.handleSendMessage(message, setState),
            user: _chatService.user,
            theme: _chatService.chatTheme,
            customBottomWidget: ChatInputBar(
                chatService: _chatService, setStateCallback: setState),
            avatarBuilder: buildAvatar,
            showUserAvatars: true,
            showUserNames: false,
            emptyState: const SizedBox.shrink(),
          ),
          if (_chatService.chatMessages.isEmpty) _buildWelcome(),
          if (_chatService.isLoading)
            const Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child:
                  Center(child: CircularProgressIndicator(color: Colors.teal)),
            ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.teal),
      centerTitle: true, // ✅ دي اللي هتخلي العنوان ف النص
      title: TitleChatAI(),
      backgroundColor: Colors.teal[50],
      elevation: 0,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.teal,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Chat History',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('New Chat'),
            onTap: () => _chatService.createNewChat(setState),
          ),
          if (_chatService.chatHistory.isEmpty)
            const ListTile(title: Text('No History chats'), enabled: false),
          ..._chatService.buildChatHistoryListTiles(setState),
        ],
      ),
    );
  }

  Widget _buildWelcome() {
    return Positioned.fill(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
              child: Image.asset('assets/images/robotlearn.png',
                  height: 150, width: 150),
            ),
            // const SizedBox(height: 8),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: const Text(
                'Welcome to AskMaster',
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class TitleChatAI extends StatelessWidget {
  const TitleChatAI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Ask",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          TextSpan(
            text: "Master",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.teal),
          ),
        ],
      ),
    );
  }
}
