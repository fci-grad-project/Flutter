import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/All%20courses/screen/course_details_page.dart';
import 'package:graduation_project/New%20cours%20catecore/model/model_cours.dart';

class CourseCard extends StatelessWidget {
  final ModelCourse course;

  CourseCard({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الكورس
            CachedNetworkImage(
              imageUrl: course.logo,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            // عنوان الكورس
            Text(
              course.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // اسم المدرب
            Text('المدرب: ${course.professor}'),
            SizedBox(height: 8),
            // التقييمات
            Row(
              children: [
                RatingBar.builder(
                  initialRating: course.ratings,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // يمكنك التعامل مع التقييم الجديد هنا
                    print(rating);
                  },
                  ignoreGestures: true, // لجعل التقييم غير قابل للتعديل
                ),
                SizedBox(width: 8),
                Text('${course.ratings}'), // عرض التقييم كنص
              ],
            ),
            SizedBox(height: 8),
            // السعر
            Text(
              course.price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // زر عرض التفاصيل
            ElevatedButton(
              onPressed: () {
                // الانتقال إلى صفحة تفاصيل الكورس
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailsPage(course: course),
                  ),
                );
              },
              child: Text('عرض التفاصيل'),
            ),
          ],
        ),
      ),
    );
  }
  }