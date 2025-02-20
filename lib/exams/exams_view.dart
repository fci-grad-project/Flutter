import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';
import 'package:graduation_project/exams/widgets/exams_body_view.dart';

class ExamsView extends StatelessWidget {
  const ExamsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // أيقونة الرجوع
          onPressed: () {
            Navigator.of(context).pop(); // الرجوع إلى الشاشة السابقة
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Exams",
          textAlign: TextAlign.center,
          style: TextStyles.bold19.copyWith(color: Colors.white),
        ),

      ),
      body: const ExamsBodyView(),
    );
  }
}
