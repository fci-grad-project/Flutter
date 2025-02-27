import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/instractour/model/Instructors_model.dart';

class InstructorsList extends StatelessWidget {
  const InstructorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // 🔥 تحديد ارتفاع مناسب لحل المشكلة
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: instructors.length,
        itemBuilder: (context, index) {
          final instructor = instructors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: Column(
              children: [
                // 🖼️ الصورة (فوق الاسم)
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: instructor.instructorLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // 🏷️ اسم المدرب (تحت الصورة)
                Text(
                  instructor.instructorProfessor,
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}