import 'package:flutter/material.dart';


class PhotoUserHome extends StatelessWidget {
  const PhotoUserHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25, // حجم الدائرة
      backgroundColor: const Color(0xff0D9276), // اللون حول الصورة
      child: ClipOval(
        child: Image.asset(
          'assets/images/student.png',
          height: 50, // حجم الصورة
          width: 50, // عرض الصورة
          fit: BoxFit.cover, // لضبط الصورة بشكل مناسب داخل الدائرة
        ),
      ),
    );
  }
}
