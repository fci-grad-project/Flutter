import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/home%20screen/view_home_screen.dart';
import 'package:graduation_project/view%20cours/screen/details_screen.dart';

class Nav extends StatefulWidget {
  @override
  State<Nav> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<Nav> {
  int _currentIndex = 1; // متغير لتتبع الصفحة النشطة

  // قائمة بالصفحات
  final List<Widget> _pages = [
    DetailsScreenCours(title: 'Flutter course',),
    HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(234, 255, 255, 255),
      body: _pages[_currentIndex], // عرض الصفحة الحالية
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color(0xff0D9276),
        color: const Color(0xff0D9276),
        animationCurve: Curves.decelerate,
        animationDuration: const Duration(milliseconds: 300),
        index: _currentIndex, // الحفاظ على الحالة عند التنقل
        onTap: (index) {
          setState(() {
            _currentIndex = index; // تحديث الصفحة عند الضغط
          });
        },
        items: const [
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
  }