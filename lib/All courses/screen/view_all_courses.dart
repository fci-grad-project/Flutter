import 'package:flutter/material.dart';
import 'package:graduation_project/All%20courses/widget/custom_courses_card_view.dart';
import 'package:graduation_project/All%20courses/widget/custom_filter_course.dart';
import 'package:graduation_project/New%20cours%20catecore/model/model_cours.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

class CoursesAll extends StatelessWidget {
  const CoursesAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(child: CustomeFiltersSection(onFilterChanged: (List<String> value) { 
            ['Programming', 'Design', 'Marketing', 'Business',];
           },)),
        ],
        body: CoursesList(),
      ),
    );
  }

  /// **App Bar**
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Text('Courses', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () {

        }),
      ],
    );
  }
}

/// **قائمة الكورسات (Courses List)**
class CoursesList extends StatelessWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseCard(
          course: courses[index],
        );
      },
    );
  }
}
