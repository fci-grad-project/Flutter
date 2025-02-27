import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/New%20cours%20catecore/model/model_cours.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/route.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';

class CourseDetailsPage extends StatelessWidget {
  final ModelCourse course;

  CourseDetailsPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(course.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الكورس
            CachedNetworkImage(
              imageUrl: course.logo,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            // عنوان الكورس
            Text(
              course.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // وصف الكورس
            Text(
              course.about,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // المحاضرات
            Text(
              'المحاضرات',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...course.lectures
                .map((lecture) => ListTile(
                      title: Text(lecture.lectureTitle),
                      subtitle: Text(lecture.lectureDuration),
                    ))
                .toList(),
            SizedBox(height: 16),
            // التسجيلات
            Text(
              'التسجيلات',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...course.records
                .map((record) => ListTile(
                      title: Text(record.professor),
                      subtitle: Text(record.recordsDuration),
                    ))
                .toList(),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.detailsScreenCours);
              },
              text: 'Start Now',
            ),
          ],
        ),
      ),
    );
  }
}
