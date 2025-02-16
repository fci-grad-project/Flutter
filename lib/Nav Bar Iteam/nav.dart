import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/home%20screen/view_home_screen.dart';
import 'package:graduation_project/view%20cours/screen/details_screen.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBar> {
  int _currentIndex = 0; // الصفحة الافتراضية هي الصفحة الرئيسية

  // قائمة الصفحات
  final List<Widget> _pages = [
    HomeScreen(),
    DetailsScreenCours(title: 'Flutter Course'),
    PlaceholderWidget("Profile", Icons.person),
    PlaceholderWidget("Settings", Icons.settings),
    PlaceholderWidget("Notifications", Icons.notifications),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.primaryColor,
        color: AppColors.primaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.white, size: 28),
          Icon(Icons.favorite, color: Colors.white, size: 28),
          Icon(Icons.notifications, color: Colors.white, size: 28),
          Icon(Icons.settings, color: Colors.white, size: 28),
          Icon(Icons.person, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}

// ودجت بديلة للصفحات غير الموجودة حاليًا
class PlaceholderWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderWidget(this.title, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 80, color: AppColors.primaryColor),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
