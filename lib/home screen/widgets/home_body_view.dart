import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/cours/screen/course_padge_body.dart';
import 'package:graduation_project/home%20screen/widgets/Photo_User_Home.dart';
import 'package:graduation_project/home%20screen/widgets/Search_Bar.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // لون خلفية فاتح لإبراز الكروت
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'HI,',
                  style: GoogleFonts.cairo(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' Ahmed',
                  style: GoogleFonts.cairo(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0D9276),
                  ),
                ),
                Spacer(),
                PhotoUserHome(),
              ],
            ),
            SizedBox(height: 16),
            NewWidget(),
            SizedBox(height: 16),

            // عنوان "My Courses" مع زر View All
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // انتقل إلى صفحة جميع الدورات
                    },
                    child: Text(
                      'The best Courses',
                      style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // decoration: TextDecoration.underline, // خط تحت النص
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // انتقل إلى صفحة جميع الدورات
                    },
                    child: Text(
                      'View All',
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            CoursesPage(),
          ],
        ),
      ),
    );
  }
}
