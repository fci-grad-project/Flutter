import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_body.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userIcon),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: Text(
                    userName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.phone, color: Colors.white),
                SizedBox(width: 16),
                Icon(FontAwesomeIcons.video, color: Colors.white),
              ],
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ChatBody(
        currentUserId: currentUserId,
        receiverId: receiverId,
      ),
    );
  }
}