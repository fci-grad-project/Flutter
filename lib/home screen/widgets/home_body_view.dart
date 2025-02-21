import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/route.dart';
import 'package:graduation_project/core/widgets/Custom_Sidebar.dart';
import 'package:graduation_project/New%20cours%20catecore/screen/course_padge_body.dart';
import 'package:graduation_project/New%20cours%20catecore/widgets/Course_Categories%20.dart';
import 'package:graduation_project/home%20screen/widgets/Live_EventsPage.dart'; // استدعاء LiveEventsList
import 'package:graduation_project/home%20screen/widgets/Photo_User_Home.dart';
import 'package:graduation_project/home%20screen/widgets/Search_Bar.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeBodyView extends StatelessWidget {
  HomeBodyView({super.key});
  final SidebarXController _sidebarController =
      SidebarXController(selectedIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: CustomSidebar(controller: _sidebarController),
      ), // لون خلفية فاتح لإبراز الكروت
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // زر القائمة الجانبية
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu,
                          color: AppColors.primaryColor, size: 30),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),

                  // النصوص (Hi, Ahmed) بتنسيق جميل
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.cairo(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: "Hi, ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Ahmed",
                            style: TextStyle(color: AppColors.primaryColor)),
                      ],
                    ),
                  ),

                  // صورة المستخدم بحجم أكبر وتنسيق جميل
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(2, 2)),
                      ],
                    ),
                    child: ClipOval(
                      child: SizedBox(
                        width: 50, // زيادة الحجم قليلاً
                        height: 50,
                        child: PhotoUserHome(),
                      ),
                    ),
                  ),
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
                        Navigator.pushNamed(context, AppRoutes.newCourse);
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
