import 'package:flutter/material.dart';
import 'package:graduation_project/view%20cours/models/lesson.dart';
import 'package:graduation_project/view%20cours/widget/lesson_card.dart';

class PlayList extends StatelessWidget {
  final Function(String) updateVideo;

  const PlayList({super.key, required this.updateVideo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessonList[index], updateVideo: updateVideo);
        },
      ),
    );
  }
}
