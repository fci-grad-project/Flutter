import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/cours/model/model_cours.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // تصغير الارتفاع ليكون أكثر أناقة
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: courses.map((course) {
            return GestureDetector(
              onTap: () {
                // استخدام Hero Animation عند الانتقال إلى صفحة التفاصيل
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CourseDetailsPage(course: course)),
                // );
              },
              child: Container(
                width: 300, // ضبط العرض ليكون متناسقًا
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25), // تنعيم الحواف
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // ======= صورة الكورس =======
                      Hero(
                        tag: course.name, // لجعل الصورة تتحرك بين الصفحات
                        child: Image.network(
                          course.logo,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 200,
                              color: Colors
                                  .grey[300], // لون Placeholder أثناء التحميل
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 100,
                              color: Colors.grey[300],
                              child: Icon(Icons.broken_image,
                                  size: 50, color: Colors.grey),
                            );
                          },
                        ),
                      ),

                      // ======= التدرج اللوني خلف النصوص =======
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),

                      // ======= نصوص المعلومات =======
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.name,
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Prof: ${course.professor}',
                              style: GoogleFonts.cairo(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // أيقونة السعر + النص
                                Row(
                                  children: [
                                    Icon(Icons.attach_money,
                                        color: Colors.red, size: 16),
                                    Text(
                                      '${course.price}',
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),

                                // زر View بشفافية خفيفة
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'View',
                                    style: GoogleFonts.cairo(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
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
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
