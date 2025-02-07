import 'package:flutter/material.dart';
import 'package:graduation_project/view%20cours/models/lesson.dart';
import 'package:graduation_project/view%20cours/widget/lesson_card.dart';

class PlayList extends StatefulWidget {
  final Function(String, String) updateVideo;
  const PlayList({super.key, required this.updateVideo});

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  String selectedVideoUrl = ""; // الفيديو الحالي المشغل

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return LessonCard(
            lesson: lessonList[index],
            updateVideo: (videoUrl, lessonTitle) {
              setState(() {
                selectedVideoUrl = videoUrl;
              });
              widget.updateVideo(videoUrl, lessonTitle);
            },
            isSelected: selectedVideoUrl == lessonList[index].videoUrl,
          );
        },
      ),
    );
  }
}
