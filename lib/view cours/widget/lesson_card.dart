import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_check_box.dart';
import 'package:graduation_project/view%20cours/models/lesson.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonCard extends StatefulWidget {
  final Lesson lesson;
  final Function(String) updateVideo;

  const LessonCard({super.key, required this.lesson, required this.updateVideo});

  @override
  _LessonCardState createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  YoutubePlayerController? _controller;
  bool isCheckBoxChecked = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    String? videoId = YoutubePlayer.convertUrlToId(widget.lesson.videoUrl);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.updateVideo(widget.lesson.videoUrl);
      },
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 50,
            child: _controller != null
                ? YoutubePlayer(controller: _controller!, showVideoProgressIndicator: true)
                : const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.lesson.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(widget.lesson.duration, style: const TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),
          CustomCheckBox(
            isChecked: isCheckBoxChecked,
            onChecked: (value) => setState(() => isCheckBoxChecked = value),
          ),
        ],
      ),
    );
  }
}
