import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_details.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';

class GroupsTab extends StatelessWidget {
  GroupsTab({super.key});

  // قائمة تحتوي على بيانات الجروبات
  final List<Map<String, String>> groupsData = [
    {'name': 'Study Group', 'image': 'assets/images/group-chat.png'},
    {'name': 'Flutter Devs', 'image': 'assets/images/group-chat.png'},
    {'name': 'Tech Enthusiasts', 'image': 'assets/images/group-chat.png'},
    {'name': 'Coding Club', 'image': 'assets/images/group-chat.png'},
    {'name': 'Gaming Community', 'image': 'assets/images/group-chat.png'},
    {'name': 'Art Lovers', 'image': 'assets/images/group-chat.png'},
    {'name': 'Travel Buddies', 'image': 'assets/images/group-chat.png'},
    {'name': 'Musicians', 'image': 'assets/images/group-chat.png'},
    {'name': 'Book Club', 'image': 'assets/images/group-chat.png'},
    {'name': 'Movie Nights', 'image': 'assets/images/group-chat.png'},
    {'name': 'Sports Club', 'image': 'assets/images/group-chat.png'},
    {'name': 'Foodies', 'image': 'assets/images/group-chat.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groupsData.length, // عدد الجروبات بناءً على القائمة
      itemBuilder: (context, index) {
        final group = groupsData[index]; // استدعاء بيانات الجروب الحالي

        return Column(
          children: [
            ListTile(
              leading:CircleAvatar(
    radius: 20, // تحديد نصف القطر لتحديد حجم الـ CircleAvatar
    backgroundColor: Colors.transparent, // إزالة لون الخلفية
    backgroundImage: AssetImage(group['image']!), // إضافة الصورة داخل الـ CircleAvatar
  ),
              title: Text(
                group['name']!,
                style: TextStyles.bold16.copyWith(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetails(
                      userName: group['name']!, // اسم الجروب
                      userIcon: group['image']!, // صورة الجروب
                      currentUserId: 'user123',  // معرف المستخدم الحالي
                      receiverId: 'group123',     // معرف الجروب
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8), // المسافة بين الجروبات
            Divider(
                thickness: 0, height: 0, color: AppColors.lightPrimaryColor),
            const SizedBox(height: 2), // مسافة إضافية بعد الخط الفاصل
          ],
        );
      },
    );
  }
}
