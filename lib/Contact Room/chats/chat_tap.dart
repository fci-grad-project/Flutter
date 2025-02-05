import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_details.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';

class ChatsTab extends StatelessWidget {
  ChatsTab({super.key});

  // قائمة تحتوي على بيانات المحادثات
  final List<Map<String, String>> chatsData = [
    {'name': 'Ahmed ', 'image': 'assets/images/student.png'},
    {'name': 'Mohamed ', 'image': 'assets/images/student.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length, // عدد المحادثات بناءً على القائمة
      itemBuilder: (context, index) {
        final chat = chatsData[index]; // استدعاء بيانات المحادثة الحالية

        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(chat['image']!),
                
                 // صورة المستخدم
              ),
              title: Text(
                chat['name']!,
                style: TextStyles.bold16.copyWith(color: Colors.black),
              ),
            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ChatDetails(
        userName: chat['name']!,
        userIcon: chat['image']!,
        currentUserId: 'user123',  // ✅ معرف المستخدم الحالي
        receiverId: 'user456',     // ✅ معرف المستقبل
      ),
    ),
  );
}

            ),
            const SizedBox(height: 8), // المسافة بين المحادثات
            Divider(
                thickness: 0, height: 0, color: AppColors.lightPrimaryColor),
            // الخط الفاصل
            const SizedBox(height: 2),
          ],
        );
      },
    );
  }

}