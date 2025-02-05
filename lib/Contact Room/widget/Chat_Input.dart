import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController messageController;
  final Function(String message, String senderId, String receiverId) onSend; // ✅ تعديل هنا
  final String senderId;   // ✅ إضافة معرف المرسل
  final String receiverId; // ✅ إضافة معرف المستقبل

  const ChatInput({super.key, 
    required this.messageController,
    required this.onSend,
    required this.senderId,   // ✅
    required this.receiverId, // ✅
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              if (messageController.text.isNotEmpty) {  // ✅ التأكد من وجود رسالة
                onSend(messageController.text, senderId, receiverId); // ✅ تمرير المعرفات
                messageController.clear();  // ✅ مسح الحقل بعد الإرسال
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff004170),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.4),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
