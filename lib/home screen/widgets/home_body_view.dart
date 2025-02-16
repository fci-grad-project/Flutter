import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/cours/screen/course_padge_body.dart';
import 'package:graduation_project/cours/widgets/Course_Categories%20.dart';
import 'package:graduation_project/home%20screen/widgets/Live_EventsPage.dart'; // استدعاء LiveEventsList
import 'package:graduation_project/home%20screen/widgets/Photo_User_Home.dart';
import 'package:graduation_project/home%20screen/widgets/Search_Bar.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white, // لون خلفية فاتح لإبراز الكروت
      body: Padding(
        padding: const EdgeInsets.only( left: 16, right: 16, top: 40),
        child: SingleChildScrollView(
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
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Spacer(),
                  PhotoUserHome(),
                ],
              ),
              SizedBox(height: 16),
              CustomSearch(),
              SizedBox(height: 16),
              Text(
                'Courses Categories',
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              CourseCategories(),
              SizedBox(height: 16),
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
                        'The New Courses',
                        style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              NewCourses(),
              SizedBox(height: 16),
              Text(
                'Live Events',
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              /// **إضافة قائمة الأحداث المباشرة هنا**
              LiveEventsList(),
            ],
          ),
        ),
      ),
    );
  }
}
