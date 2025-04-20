import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:graduation_project/Ai%20Tech/model/Uuid.dart';
import 'package:graduation_project/Ai%20Tech/model/api_serves.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ChatScreenAI extends StatefulWidget {
  @override
  _ChatScreenAIState createState() => _ChatScreenAIState();
}

class _ChatScreenAIState extends State<ChatScreenAI> {
  final TextEditingController _controller = TextEditingController();
  final List<chat_types.Message> _chatMessages = [];
  final List<List<chat_types.Message>> _chatHistory = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;

    setState(() => _isLoading = true);

    final userMessage = _controller.text;
    final userChatMessage = chat_types.TextMessage(
      author: chat_types.User(id: 'user'),
      id: Uuid().v4(),
      text: userMessage,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _chatMessages.insert(0, userChatMessage);
    });

    _controller.clear();

    final response = await ApiService().sendMessage(userMessage, 'Gemini');
    final botChatMessage = chat_types.TextMessage(
      author: chat_types.User(id: 'bot'),
      id: Uuid().v4(),
      text: response,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _chatMessages.insert(0, botChatMessage);
      _isLoading = false;
    });
  }

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final size = await File(image.path).length();

      final imageMessage = chat_types.ImageMessage(
        author: chat_types.User(id: 'user'),
        id: Uuid().v4(),
        name: image.name,
        size: size,
        uri: image.path,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      setState(() {
        _chatMessages.insert(0, imageMessage);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image added to chat.')),
      );
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final fileMessage = chat_types.FileMessage(
        author: chat_types.User(id: 'user'),
        id: Uuid().v4(),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: file.path,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      setState(() {
        _chatMessages.insert(0, fileMessage);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File added to chat.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chatbot'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Chat History',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('New Chat'),
              onTap: () {
                if (_chatMessages.isNotEmpty) {
                  _chatHistory.add(List.from(_chatMessages));
                }
                setState(() => _chatMessages.clear());
                Navigator.pop(context);
              },
            ),
            if (_chatHistory.isEmpty)
              const ListTile(
                title: Text('No previous chats'),
                enabled: false,
              ),
            ..._chatHistory.asMap().entries.map((entry) {
              int index = entry.key;
              List<chat_types.Message> chat = entry.value;
              return ListTile(
                title: Text('Chat ${index + 1}'),
                subtitle: Text(
                  chat.isNotEmpty && chat.last is chat_types.TextMessage
                      ? (chat.last as chat_types.TextMessage).text
                      : 'Media/Empty chat',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  setState(() {
                    _chatMessages.clear();
                    _chatMessages.addAll(chat.reversed);
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Chat(
                  messages: _chatMessages,
                  onSendPressed: (chat_types.PartialText message) {
                    _controller.text = message.text;
                    _sendMessage();
                  },
                  user: chat_types.User(id: 'user'),
                  theme: DefaultChatTheme(
                    primaryColor: Colors.teal,
                    secondaryColor: Colors.grey[300]!,
                    inputBackgroundColor: Colors.teal[50]!,
                    inputTextColor: Colors.black,
                    inputBorderRadius: BorderRadius.circular(20),
                    messageBorderRadius: 15,
                  ),
                  showUserAvatars: false,
                  showUserNames: false,
                ),
                if (_isLoading)
                  const Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.teal),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.teal),
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.teal),
                  onPressed: _pickFile,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.teal[50],
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
