import 'package:flutter/material.dart';

class CourseCategories extends StatefulWidget {
  const CourseCategories({super.key});

  @override
  _CourseCategoriesState createState() => _CourseCategoriesState();
}

class _CourseCategoriesState extends State<CourseCategories> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> categories = [
    {"name": "Programming", "icon": Icons.code, "color": Colors.blue},
    {"name": "Science", "icon": Icons.science, "color": Colors.green},
    {"name": "Business", "icon": Icons.business_center, "color": Colors.orange},
    {"name": "Art", "icon": Icons.brush, "color": Colors.purple},
  ];

  void navigateToCategoryPage(String categoryName) {
    // يمكنك هنا تنفيذ التنقل لصفحة الفئة المختارة
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع متساوٍ
        children: categories.map((category) {
          int index = categories.indexOf(category);
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              navigateToCategoryPage(category['name']);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 85, // جعل جميع العناصر بنفس الحجم
              height: 80,
              decoration: BoxDecoration(
                color: category['color'], // لون مختلف لكل عنصر
                borderRadius: BorderRadius.circular(12),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: category['color'].withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(2, 4),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'],
                    size: isSelected ? 44 : 40, // تكبير عند الضغط
                    color: Colors.white, // الأيقونات باللون الأبيض
                  ),
                  SizedBox(height: 6),
                  Text(
                    category['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white, // النص باللون الأبيض
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
