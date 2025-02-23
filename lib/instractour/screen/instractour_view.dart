import 'package:flutter/material.dart';
import 'package:graduation_project/instractour/model/Instructors_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/instractour/widgets/instractour_card.dart';


class InstructorsScreen extends StatelessWidget {
  const InstructorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instructors",
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        backgroundColor: const Color(0xff0A97B0),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.70, // تعديل النسبة ليكون أفضل
          ),
          itemCount: instructors.length,
          itemBuilder: (context, index) {
            final instructor = instructors[index];
            return InstructorCard(instructor: instructor);
          },
        ),
      ),
    );
  }
}

