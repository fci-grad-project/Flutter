import 'package:flutter/material.dart';
import 'package:graduation_project/All%20courses/widget/Course_all_card.dart';
import 'package:graduation_project/All%20courses/widget/cusome_Hero_Section.dart';
import 'package:graduation_project/New%20cours%20catecore/model/model_cours.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

class CoursesAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(child: HeroSection()),
          SliverToBoxAdapter(child: FiltersSection()),
        ],
        body: CoursesList(),
      ),
    );
  }

  /// **App Bar**
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Text('All Courses'),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ],
    );
  }
}


/// **قسم الفلاتر (Filters Section)**
class FiltersSection extends StatelessWidget {
  final List<String> filters = ['برمجة', 'تصميم', 'تسويق'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: filters.map((filter) => _buildFilterChip(filter)).toList(),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: FilterChip(
        label: Text(label),
        onSelected: (bool value) {},
        backgroundColor: Colors.blue[100],
        selectedColor: Colors.blueAccent,
      ),
    );
  }
}

/// **قائمة الكورسات (Courses List)**
class CoursesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseCard(
          course: courses[index],
        );
      },
    );
  }
}
