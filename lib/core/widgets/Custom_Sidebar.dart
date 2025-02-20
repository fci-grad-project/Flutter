import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/chat_view.dart';
import 'package:graduation_project/Login&Signup_Page/LoginView.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/exams/exams_view.dart';
import 'package:graduation_project/home%20screen/widgets/Photo_User_Home.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

class CustomSidebar extends StatelessWidget {
  final SidebarXController controller;

  const CustomSidebar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(3, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // صورة المستخدم واسم المستخدم
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 8,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: PhotoUserHome(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ahmed Elashry', // اسم المستخدم
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // القائمة الجانبية بالعناصر الجديدة
            SidebarItem(icon: Iconsax.profile_circle, label: 'Profile', onTap: () {}),
            _buildDivider(),

            SidebarItem(icon: Iconsax.message, label: 'Chats', onTap: () => _navigateTo(context, ChatView())),
            _buildDivider(),

            SidebarItem(icon: Iconsax.book, label: 'Exams', onTap: () => _navigateTo(context, ExamsView())),
            _buildDivider(),

            SidebarItem(icon: Iconsax.play_circle, label: 'Courses', onTap: () {}), // 🆕 الكورسات
            _buildDivider(),

            SidebarItem(icon: Iconsax.clipboard_text, label: 'Assignments', onTap: () {}), // 🆕 الواجبات
            _buildDivider(),

            SidebarItem(icon: Iconsax.notification, label: 'Notifications', onTap: () {}), // 🆕 الإشعارات
            _buildDivider(),

            SidebarItem(icon: Iconsax.setting, label: 'Settings', onTap: () {}),
            _buildDivider(),

            SidebarItem(icon: Iconsax.info_circle, label: 'Help', onTap: () {}),
            _buildDivider(),



            SidebarItem(
              icon: Iconsax.logout,
              label: 'Logout',
              onTap: () => _navigateTo(context, LoginView()),
              iconColor: Colors.red,
              textColor: Colors.red,
            ),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(color: Colors.grey.shade300, thickness: 1),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.blue.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? AppColors.primaryColor, size: 26),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const CustomSidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.blue.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? AppColors.primaryColor, size: 26),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
