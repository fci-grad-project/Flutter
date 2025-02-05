import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/widget/Chat_Input.dart';
import 'package:graduation_project/Contact%20Room/widget/bubble_chat.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_controller.dart';
import 'package:provider/provider.dart';

class ChatBody extends StatelessWidget {
  final String currentUserId; // ✅ معرف المستخدم الحالي
  final String receiverId;    // ✅ معرف المستقبل

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
          return Stack( // ✅ استخدام Stack لوضع الصورة في الخلف
            children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0, // ✅ تمديد الصورة للأسفل بمقدار 100 بكسل
                child: Image.asset(
                  'assets/images/background chat.jpeg',
                  fit: BoxFit.cover,
                ),
              ),

              // ✅ محتوى الدردشة فوق الخلفية
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: chatController.scrollController,
                      itemCount: chatController.messages.length,
                      itemBuilder: (context, index) {
                        final message = chatController.messages[index];
                        bool isCurrentUser = message.senderId == currentUserId;
                        return ChatBubble(
                          message: message.message,
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
                          message: message,
                          senderId: senderId,
                          receiverId: receiverId,
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
