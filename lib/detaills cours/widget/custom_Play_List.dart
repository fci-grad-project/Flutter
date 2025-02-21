import 'package:flutter/material.dart';
import 'package:graduation_project/detaills%20cours/models/lesson.dart';
import 'package:graduation_project/detaills%20cours/widget/lesson_card.dart';

class PlayList extends StatefulWidget {
  final Function(String, String) updateVideo;
  
  const PlayList({super.key, required this.updateVideo});

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  final selectedVideoUrl = ValueNotifier<String>(""); // ✅ إصلاح الخطأ هنا

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return ValueListenableBuilder<String>(
            valueListenable: selectedVideoUrl,
            builder: (_, selectedUrl, __) {
              return LessonCard(
                lesson: lessonList[index],
                updateVideo: (videoUrl, lessonTitle) {
                  selectedVideoUrl.value = videoUrl; // ✅ تحديث القيمة بالطريقة الصحيحة
                  widget.updateVideo(videoUrl, lessonTitle);
                },
                isSelected: selectedUrl == lessonList[index].videoUrl,
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    selectedVideoUrl.dispose(); // ✅ تنظيف `ValueNotifier` عند الخروج
    super.dispose();
  }
}
