import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';
import 'package:graduation_project/view%20cours/widget/Custom_Icon_Button.dart';
import 'package:graduation_project/view%20cours/widget/Custom_Tab_View.dart';
import 'package:graduation_project/view%20cours/widget/Enroll_Bottom_Sheet.dart';
import 'package:graduation_project/view%20cours/widget/custom_Play_List.dart';
import 'package:graduation_project/view%20cours/widget/custom_discrbtion.dart';
import 'package:graduation_project/view%20cours/widget/custom_video_player.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  const DetailsScreen({super.key, required this.title});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTag = 0;
  String currentVideoUrl = "https://youtu.be/A5XwpzrVrrY?si=SYjBONNeCAq4xN-Q"; // الفيديو الأساسي

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  void updateVideo(String newUrl) {
    setState(() {
      currentVideoUrl = newUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text("Flutter Course", style: TextStyles.bold19.copyWith(color: Colors.black)),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // ✅ تمرير الفيديو الحالي إلى المشغل
                CustomVideoPlayer(videoUrl: currentVideoUrl),

                const SizedBox(height: 15),
                const Text("Flutter Novice to Ninja", style: TextStyles.bold19),
                const SizedBox(height: 3),
                const Text("Created by DevWheels", style: TextStyles.regular13),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Image.asset('assets/images/star.png', height: 20),
                    const Text(" 4.8", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16)),
                    const SizedBox(width: 15),
                    Image.asset('assets/images/clock.png', height: 20),
                    const Text(" 72 Hours", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16)),
                    const Spacer(),
                    Text(" FREE", style: TextStyles.semiBold16.copyWith(color: Colors.red)),
                  ],
                ),
                const SizedBox(height: 15),

                CustomTabView(index: _selectedTag, changeTab: changeTab),

                // ✅ تمرير دالة `updateVideo` إلى `PlayList`
                _selectedTag == 0 ? PlayList(updateVideo: updateVideo) : const Description(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return SizedBox(height: 80, child: EnrollBottomSheet(title: 'FREE'));
          },
        ),
      ),
    );
  }
}
