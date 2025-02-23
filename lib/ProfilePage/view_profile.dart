import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false; // Define isDarkMode variable
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/student.png'), // صورة افتراضية
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Iconsax.edit, color: Colors.white, size: 25),
                      onPressed: () {
                        // إضافة خيار تعديل الصورة
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              " Ahmed Elashry",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "ahmed@studentmail.com",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem("Courses", "5"),
                _buildStatItem("Certificates", "3"),
                _buildStatItem("Tasks", "20"),
              ],
            ),
            SizedBox(height: 20),
            // Row(
            //   children: [
            //     Expanded(child: Divider(color: AppColors.primaryColor, thickness: 2)),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //       child: Text(
            //         "Edit Profile",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: AppColors.primaryColor,
            //         ),
            //       ),
            //     ),
            //     Expanded(child: Divider(color: AppColors.primaryColor, thickness: 2)),
            //   ],
            // ),
            SizedBox(height: 10),
            _buildOptionItem(Iconsax.lock, "Change Password"),
            Divider(color: Colors.grey, thickness: 1),
ListTile(
  leading: Icon(Iconsax.moon, color: AppColors.primaryColor),
  title: Text("App Theme"),
  trailing: Transform.scale(
    scale: 1.0, // تصغير الـ Switch قليلاً ليبدو أنيقًا
    child: CupertinoSwitch(
      value: isDarkMode,
      activeTrackColor: AppColors.primaryColor,
      inactiveTrackColor: Colors.grey.shade300,
      onChanged: (value) {
        // تغيير المود هنا
      },
    ),
  ),
),
            Divider(color: Colors.grey, thickness: 1),
            _buildOptionItem(Iconsax.notification, "Notification Settings"),
            Divider(color: Colors.grey, thickness: 1),
            _buildOptionItem(Iconsax.global, "Language Preferences"),
            Divider(color: Colors.grey, thickness: 1),
            _buildOptionItem(Iconsax.logout, "Logout"),
            SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: Text(
                  "Delete Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildOptionItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(title),
      trailing: Icon(Iconsax.arrow_right_3, size: 16, color: Colors.grey),
      onTap: () {
        // إضافة الحدث المناسب عند الضغط
      },
    );
  }
}
