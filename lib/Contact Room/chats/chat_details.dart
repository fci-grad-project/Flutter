import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_controller.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_body.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:provider/provider.dart';


class ChatDetails extends StatelessWidget {
  final String userName;
  final String userIcon;
  final String currentUserId; // ✅ معرف المستخدم الحالي
  final String receiverId;    // ✅ معرف المستقبل

  const ChatDetails({
    super.key,
    required this.userName,
    required this.userIcon,
    required this.currentUserId, // ✅
    required this.receiverId,    // ✅
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatController(),
      child: Scaffold(
        appBar:AppBar(
  backgroundColor: AppColors.primaryColor, // تعيين لون الخلفية
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // لتوزيع العناصر بشكل جيد
    children: [
      Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userIcon),
          ),
          SizedBox(width: 10),// مسافة بين الأيقونة والاسم
          Text(
            userName,
            style: TextStyle(
              color: Colors.white, // تغيير لون الاسم إلى الأبيض
            ),
          ),
        ],
      ),
      Row(
        children: [
          Icon(
            FontAwesomeIcons.phone,
            color: Colors.white, // تغيير لون أيقونة الهاتف إلى الأبيض
          ),
          SizedBox(width: 16), // مسافة بين الأيقونات
          Icon(
            FontAwesomeIcons.video,
            color: Colors.white, // تغيير لون أيقونة الفيديو إلى الأبيض
          ),
        ],
      ),
    ],
  ),
  iconTheme: IconThemeData(
    color: Colors.white, // تغيير لون أيقونة العودة إلى الأبيض
  ),
),
        body: ChatBody(
          currentUserId: currentUserId, // ✅ تمرير معرف المستخدم الحالي
          receiverId: receiverId,       // ✅ تمرير معرف المستقبل
        ),
      ),
    );
  }
}