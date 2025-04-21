import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_types;
import 'package:graduation_project/Ai%20Tech/model/chat_service.dart';

class ChatInputBar extends StatelessWidget {
  final ChatService chatService;
  final void Function(VoidCallback fn) setStateCallback;

  const ChatInputBar({required this.chatService, required this.setStateCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              chatService.isListening ? Icons.mic_off : Icons.mic,
              color: Colors.teal,
            ),
            onPressed: () => chatService.toggleListening(setStateCallback),
          ),
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.teal),
            onPressed: () => chatService.pickFile(context, setStateCallback),
          ),
          Expanded(
            child: TextField(
              controller: chatService.controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal[50],
                hintText: 'Type a Message',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onSubmitted: (_) {
                if (chatService.controller.text.trim().isNotEmpty) {
                  chatService.handleSendMessage(
                    chat_types.PartialText(text: chatService.controller.text),
                    setStateCallback,
                  );
                }
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.teal),
            onPressed: () {
              if (chatService.controller.text.trim().isNotEmpty) {
                chatService.handleSendMessage(
                  chat_types.PartialText(text: chatService.controller.text),
                  setStateCallback,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
