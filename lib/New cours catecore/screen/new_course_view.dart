import 'package:flutter/material.dart';
import 'package:graduation_project/New%20cours%20catecore/model/model_cours.dart';

import 'package:graduation_project/detaills%20cours/screen/details_screen.dart'; // استيراد شاشة التفاصيل

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff0A97B0), // لون التطبيق الأساسي
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: courses.length,
          separatorBuilder: (context, index) => SizedBox(height: 12), // مسافة بين الكروت
          itemBuilder: (context, index) {
            final course = courses[index];

            return InkWell(
              onTap: () {
                // ✅ الانتقال إلى شاشة التفاصيل عند الضغط
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreenCours(title: course.name),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    // ✅ الصورة تأخذ كامل الكارد
                    Image.network(
                      course.logo,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),

                    // ✅ الطبقة الشفافة خلف النص
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    // ✅ المعلومات فوق الصورة
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            course.about,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: const Color.fromARGB(255, 247, 241, 241), fontSize: 14),
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '⭐ ${course.ratings}',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                course.price,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
