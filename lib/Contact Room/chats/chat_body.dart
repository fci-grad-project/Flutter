import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/model/message_model.dart';
import 'package:graduation_project/Contact%20Room/widget/Chat_Input.dart';
import 'package:graduation_project/Contact%20Room/widget/bubble_chat.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_controller.dart';
import 'package:provider/provider.dart';

class ChatBody extends StatelessWidget {
  final String currentUserId;
  final String receiverId;

  const ChatBody({
    super.key,
    required this.currentUserId,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ChatController>(
        builder: (context, chatController, child) {
          final messages = chatController.getMessagesForUser(receiverId);

          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background chat.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: chatController.scrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        bool isCurrentUser = message.senderId == currentUserId;
                        return ChatBubble(
                          message: message.messageText ?? "",
                          isCurrentUser: isCurrentUser,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ChatInput(
                      messageController: chatController.messageController,
                      senderId: currentUserId,
                      receiverId: receiverId,
                      onSend: (String message, String senderId, String receiverId) {
                        chatController.sendMessage(
                          messageText: message,
                          receiverId: receiverId,
                          receiverName: contacts.firstWhere((c) => c.messageId.toString() == receiverId).messageName,
                          receiverLogo: contacts.firstWhere((c) => c.messageId.toString() == receiverId).messageLogo,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
