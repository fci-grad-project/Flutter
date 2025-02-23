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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                // 🖼️ الصورة (فوق الاسم)
                Container(
                  width: 85,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      instructor.instructorLogo,
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
