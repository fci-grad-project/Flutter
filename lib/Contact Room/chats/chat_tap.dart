import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_details.dart';
import 'package:graduation_project/Contact%20Room/model/message_model.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];

        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(contact.messageLogo), // ✅ صورة المستخدم
              ),
              title: Text(
                contact.messageName, // ✅ اسم المستخدم
                style: TextStyles.bold16.copyWith(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetails(
                      userName: contact.messageName,
                      userIcon: contact.messageLogo,
                      currentUserId: 'user123',  // 🔴 يجب استبداله بمعرف المستخدم الفعلي
                      receiverId: contact.messageId.toString(), // ✅ معرف المستقبل
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Divider(thickness: 0, height: 0, color: AppColors.lightPrimaryColor),
            const SizedBox(height: 2),
          ],
        );
      },
    );
  }
}
