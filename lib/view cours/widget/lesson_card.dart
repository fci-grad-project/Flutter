import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_check_box.dart';
import 'package:graduation_project/view%20cours/models/lesson.dart';

class LessonCard extends StatefulWidget {
  final Lesson lesson;
  final Function(String, String) updateVideo; // تحديث الفيديو والعنوان
  final bool isSelected; // معرفة ما إذا كان الفيديو الحالي مشغلًا أم لا

  const LessonCard({
    super.key,
    required this.lesson,
    required this.updateVideo,
    required this.isSelected,
  });

  @override
  _LessonCardState createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  bool isPressed = false; // للتحكم في الأنيميشن
  bool isCheckBoxChecked = false; // للتحكم في حالة الـ Checkbox

  @override
  void initState() {
    super.initState();
    isCheckBoxChecked = widget.isSelected; // تحديث حالة الـ Checkbox تلقائيًا
  }

  @override
  void didUpdateWidget(LessonCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      setState(() => isCheckBoxChecked = widget.isSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() => isPressed = false);
        });
        widget.updateVideo(widget.lesson.videoUrl, widget.lesson.name); // تحديث الفيديو والعنوان
      },
      onTapCancel: () => setState(() => isPressed = false),

      child: AnimatedScale(
        scale: isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100), 
        child: Row(
          children: [
            Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                color: widget.isSelected ? Colors.blue.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.play_arrow, color: Colors.black), // رمز تشغيل الفيديو
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
      ),
    );
  }
}
