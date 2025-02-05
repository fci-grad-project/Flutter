import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/widget/Tap_Bar.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_tap.dart';
import 'package:graduation_project/Contact%20Room/groups/group_tap.dart';
import 'package:graduation_project/Contact%20Room/widget/live_tap.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);  // تغيير length إلى 3
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Contact Room",
          textAlign: TextAlign.center,
          style: TextStyles.bold19.copyWith(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Column(
            children: [
              SizedBox(height: 20),
              TapBar(tabController: _tabController),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatsTab(),  // محتوى تبويب المحادثات
          GroupsTab(), // محتوى تبويب المجموعات
          LiveTap(), // محتوى تبويب "Live Room"
        ],
      ),
    );
  }
}

