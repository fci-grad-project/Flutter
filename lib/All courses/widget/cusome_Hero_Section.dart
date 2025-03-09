import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/route.dart';

class HeroSection extends StatelessWidget {
  final List<String> images = [
    'assets/images/poster.png',
    'assets/images/poster2.png',
    'assets/images/poster3.png',
    'assets/images/poster4.png',
  ];

   HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // 🔹 تقليل الارتفاع ليكون متناسقًا مع شاشة الهوم
      child: Stack(
        children: [
          _buildImageSlider(),
          _buildGradientOverlay(),
          _buildHeroText(context),
        ],
      ),
    );
  }

  /// **🔹 سلايدر الصور المتحرك**
  Widget _buildImageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180, // ✅ ضبط ارتفاع السلايدر ليتناسب مع المساحة الجديدة
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
      items: images.map((image) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }

  /// **🔹 طبقة شفافة على الصور لتحسين قراءة النصوص**
  Widget _buildGradientOverlay() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.6),
          ],
        ),
      ),
    );
  }

  /// **🔹 النصوص داخل الـ Hero Section**
  Widget _buildHeroText(BuildContext context) {
    return Positioned(
      left: 15,
      right: 15,
      top: 40, // ✅ تقليل المسافة العلوية ليكون النص متناسقًا مع الحجم الجديد
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitleText(),
          SizedBox(height: 6), // ✅ تقليل التباعد بين النصوص
          _buildSubtitleText(),
          SizedBox(height: 10),
          _buildStartButton(context),
        ],
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      'Start Learning Now 🚀',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18, // ✅ تقليل حجم العنوان
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(color: Colors.black.withOpacity(0.8), blurRadius: 10, offset: Offset(2, 2)),
        ],
      ),
    );
  }

  Widget _buildSubtitleText() {
    return Text(
      'Upgrade your skills with top courses',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14, // ✅ تقليل حجم النص الفرعي
        color: Colors.white,
        shadows: [
          Shadow(color: Colors.black.withOpacity(0.8), blurRadius: 5, offset: Offset(1, 1)),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.coursesall);
      },
      icon: Icon(Icons.play_arrow, size: 18),
      label: Text('Start Now', style: TextStyle(color: Colors.black, fontSize: 14)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}