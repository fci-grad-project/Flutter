import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_view_body.dart';
import 'package:graduation_project/view%20cours/screen/details_screen.dart';

// استيراد الشاشات المطلوبة


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: controller.backgroundColors[controller.selectedIndex.value],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
            indicatorColor: Colors.transparent, // إزالة تأثير التحديد
            labelTextStyle: MaterialStateProperty.all(TextStyles.semiBold16), // تغيير الخط
          ),
        ),
        child: Obx(
          () => NavigationBar(
            backgroundColor: Colors.white,
            height: 45,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.changeTab(index),
            destinations: [
              NavigationDestination(
                icon: Image.asset('assets/images/home.png', height: 30),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Image.asset('assets/images/online-course.png', height: 30),
                label: 'Courses',
              ),
              NavigationDestination(
                icon: Image.asset('assets/images/add-to-favorites.png', height: 30),
                label: 'Favorites',
              ),
              NavigationDestination(
                icon: Image.asset('assets/images/live-chat.png', height: 35),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Image.asset('assets/images/books.png', height: 35),
                label: 'Books',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]), // عرض الشاشة بناءً على التاب المحدد
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),        // شاشة الهوم
    DetailsScreen(title: 'Flutter Course',),     // شاشة الكورسات
    FavoritesScreen(),   // شاشة المفضلة (افتراضية)
    ChatViewBody(),      // شاشة الدردشة
    BooksScreen(),       // شاشة الكتب (افتراضية)
  ];

  final backgroundColors = [
    Colors.blue.shade100,
    Colors.purple.shade100,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
  ];

 void changeTab(int index) {
    if (index >= 0 && index < screens.length) { // تأكد أن الفهرس صحيح
      selectedIndex.value = index;
    }
  }
}

// تعريف الشاشات الاختبارية
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("🏠 Home Screen", style: TextStyle(fontSize: 24)));
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("❤️ Favorites", style: TextStyle(fontSize: 24)));
  }
}

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("📚 Books", style: TextStyle(fontSize: 24)));
  }
}

// تعريف كلاس TextStyles
class TextStyles {
  static const TextStyle semiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
