
import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_check_box.dart';
import 'package:graduation_project/home/models/lesson.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  LessonCard({super.key, required this.lesson});    bool isCheckBoxChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        lesson.isPlaying
            ? Image.asset(
                'assets/images/play_outlined.png',
                height: 45,
              )
            : Image.asset(
                'assets/images/play.png',
                height: 40,
              ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                lesson.duration,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        CustomCheckBox(
          isChecked: isCheckBoxChecked,
          onChecked: (value) {
            isCheckBoxChecked = value;
          },
        ),
      ],
    );
  }
}