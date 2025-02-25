import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/New%20cours%20catecore/screen/course_padge_body.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/route.dart';
import 'package:graduation_project/core/widgets/Custom_Sidebar.dart';
import 'package:graduation_project/New%20cours%20catecore/widgets/Course_Categories%20.dart';
import 'package:graduation_project/home%20screen/widgets/Live_EventsPage.dart';
import 'package:graduation_project/home%20screen/widgets/Photo_User_Home.dart';
import 'package:graduation_project/home%20screen/widgets/Search_Bar.dart';
import 'package:graduation_project/instractour/widgets/Instructors_List.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeBodyView extends StatelessWidget {
  HomeBodyView({super.key});

  final SidebarXController _sidebarController = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      drawer: Drawer(child: CustomSidebar(controller: _sidebarController)),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// **👤 Header (صورة المستخدم + الاسم + القائمة الجانبية)**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          icon: Icon(Icons.menu, color: AppColors.primaryColor, size: 30),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.cairo(fontSize: 25, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: "Hi, ", style: TextStyle(color: Colors.black)),
                            TextSpan(text: "Ahmed", style: TextStyle(color: AppColors.primaryColor)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            // BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, offset: Offset(2, 2)),
                          ],
                        ),
                        child: ClipOval(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: PhotoUserHome(),
                          ),
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 2),
                  CustomSearch(),
                  const SizedBox(height: 10),
                  Text(
                    'Courses Categories',
                    style: GoogleFonts.cairo(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  CourseCategories(),
      
                  const SizedBox(height: 10),
                  _buildSectionHeader(
                    context,
                    title: "The New Courses",
                    onViewAll: () => Navigator.pushNamed(context, AppRoutes.newCourse),
                  ),
                  const SizedBox(height: 8),
                  NewCourses(),
      
                  const SizedBox(height: 8),
                  _buildSectionHeader(
                    context,
                    title: "Instructors",
                    onViewAll: () => Navigator.pushNamed(context, AppRoutes.instractour),
                  ),
                  const SizedBox(height: 8),
                  InstructorsList(),
                  const SizedBox(height: 12),
                  Text(
                    'Live Events',
                    style: GoogleFonts.cairo(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  LiveEventsList(),
      
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **📌 مكون لإنشاء عنوان الأقسام مع زر "View All"**
  Widget _buildSectionHeader(BuildContext context, {required String title, required VoidCallback onViewAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: Text(
            'View All',
            style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
