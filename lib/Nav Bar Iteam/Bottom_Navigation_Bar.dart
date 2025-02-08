import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_view_body.dart';
import 'package:graduation_project/home%20screen/view_home_screen.dart';
import 'package:graduation_project/view%20cours/screen/details_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavigationController()); // تحميل الكونترولر فقط عند الحاجة

    return GetBuilder<NavigationController>(
      builder: (controller) => Scaffold(
        backgroundColor: controller.backgroundColors[controller.selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            navigationBarTheme: NavigationBarThemeData(
              indicatorColor: Colors.transparent, // إزالة تأثير التحديد الافتراضي
              labelTextStyle: MaterialStateProperty.all(TextStyles.semiBold16),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            height: 40,
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: controller.changeTab,
            destinations: List.generate(controller.screens.length, (index) {
              return NavigationDestination(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(controller.icons[index], height: 30),
                    const SizedBox(height: 3),
                    if (controller.selectedIndex == index)
                      Container(
                        width: 20,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.black, // لون الخط السفلي عند التحديد
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
                label: controller.labels[index],
              );
            }),
          ),
        ),
        body: controller.screens[controller.selectedIndex],
      ),
    );
  }
}

class NavigationController extends GetxController {
  var selectedIndex = 0;

  final screens = [
    HomeScreen(),
    DetailsScreen(title: 'Flutter Course'),
    FavoritesScreen(),
    ChatViewBody(),
    BooksScreen(),
  ];

  final backgroundColors = [
    Colors.white,
    Colors.purple.shade100,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
  ];

  final icons = [
    'assets/images/home.png',
    'assets/images/online-course.png',
    'assets/images/add-to-favorites.png',
    'assets/images/live-chat.png',
    'assets/images/books.png',
  ];

  final labels = ['Home', 'Courses', 'Favorites', 'Chat', 'Books'];

  void changeTab(int index) {
    if (index >= 0 && index < screens.length) {
      selectedIndex = index;
      update(); // تحديث الـ UI بدون الحاجة إلى Obx
    }
  }
}

// تعريف الشاشات التجريبية


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
