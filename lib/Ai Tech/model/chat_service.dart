import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:graduation_project/Ai%20Tech/model/Uuid.dart';
import 'package:graduation_project/Ai%20Tech/model/api_serves.dart';
import 'package:file_picker/file_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatService {
  final TextEditingController controller = TextEditingController();
  final List<chat_types.Message> chatMessages = [];
  final List<List<chat_types.Message>> chatHistory = [];
  final stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;
  bool isLoading = false;

  final chat_types.User user = chat_types.User(id: 'user');
  final chat_types.User bot = chat_types.User(id: 'bot');

  void handleSendMessage(chat_types.PartialText message, void Function(VoidCallback fn) setState) async {
    if (message.text.isEmpty) return;

    setState(() => isLoading = true);
    final userMessage = message.text;

    final userChatMessage = chat_types.TextMessage(
      author: user,
      id: Uuid().v4(),
      text: userMessage,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      chatMessages.insert(0, userChatMessage);
    });

    controller.clear();

    final response = await ApiService().sendMessage(userMessage, 'Gemini');

    final botChatMessage = chat_types.TextMessage(
      author: bot,
      id: Uuid().v4(),
      text: response,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      chatMessages.insert(0, botChatMessage);
      isLoading = false;
    });
  }

  void createNewChat(void Function(VoidCallback fn) setState) {
    if (chatMessages.isNotEmpty) {
      chatHistory.add(List.from(chatMessages));
    }
    setState(() {
      chatMessages.clear();
    });
  }

  List<Widget> buildChatHistoryListTiles(void Function(VoidCallback fn) setState) {
    return chatHistory.asMap().entries.map((entry) {
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
            chatMessages.clear();
            chatMessages.addAll(chat.reversed);
          });
        },
      );
    }).toList();
  }

  DefaultChatTheme get chatTheme => DefaultChatTheme(
        primaryColor: Colors.teal,
        secondaryColor: Colors.grey[300]!,
        inputBackgroundColor: Colors.teal[50]!,
        inputTextColor: Colors.black,
        inputBorderRadius: BorderRadius.circular(20),
        messageBorderRadius: 15,
      );

  void toggleListening(void Function(VoidCallback fn) setState) async {
    if (!isListening) {
      bool available = await speech.initialize();
      if (available) {
        setState(() => isListening = true);
        speech.listen(onResult: (val) => controller.text = val.recognizedWords);
      }
    } else {
      setState(() => isListening = false);
      speech.stop();
    }
  }

  void pickFile(BuildContext context, void Function(VoidCallback fn) setState) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final fileMessage = chat_types.FileMessage(
        author: user,
        id: Uuid().v4(),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: file.path,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      setState(() {
        chatMessages.insert(0, fileMessage);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File added to chat.')),
      );
    }
  }
}
