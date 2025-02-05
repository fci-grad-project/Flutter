import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_check_box.dart';
import 'package:graduation_project/home/models/lesson.dart';
import 'package:graduation_project/home/widget/custom_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonCard extends StatefulWidget {
  final Lesson lesson;
  LessonCard({super.key, required this.lesson});

  @override
  _LessonCardState createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  late YoutubePlayerController _controller;
  bool isCheckBoxChecked = false;
  bool isVideoExpanded = false;  // متغير للتحقق إذا كان الفيديو كامل أم لا

  @override
  void initState() {
    super.initState();
    // تحويل رابط الفيديو من يوتيوب إلى videoId
    String? videoId = YoutubePlayer.convertUrlToId(widget.lesson.videoUrl);

    if (videoId == null) {
      // إذا كان التحويل غير ناجح، استخدم قيمة افتراضية
      videoId = 'dQw4w9WgXcQ'; // مثال على فيديو افتراضي
    }

    // تحميل الفيديو باستخدام المعرف
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // دالة للتبديل بين عرض الفيديو المصغر والكامل
  void toggleVideo() {
    setState(() {
      isVideoExpanded = !isVideoExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleVideo,  // عند الضغط على الفيديو المصغر يتم التبديل
          child: Row(
            children: [
              // عرض الفيديو المصغر بجانب النص
              SizedBox(
                width: isVideoExpanded ? 300 : 70,  // إذا كان الفيديو موسعًا نعرضه أكبر
                height: isVideoExpanded ? 200 : 50,  // إذا كان الفيديو موسعًا نعرضه أكبر
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.lesson.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.lesson.duration,
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
                  setState(() {
                    isCheckBoxChecked = value;
                  });
                },
              ),
            ],
          ),
        ),
        // إذا كان الفيديو موسعًا نعرض الفيديو الكامل في مكانه
        if (isVideoExpanded)
          CustomVideoPlayer(
            videoUrl: widget.lesson.videoUrl,  // تمرير الرابط للفيديو الكامل
          ),
      ],
    );
  }
}