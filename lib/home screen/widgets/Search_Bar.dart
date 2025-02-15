import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) {
        return SearchBar(
          controller: controller,
          hintText: "Search...",
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16, // تكبير حجم الخط قليلاً
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 12), // إضافة بعض التباعد
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.primaryColor, width: 2),
            ),
          ),
          shadowColor: MaterialStateProperty.all(AppColors.primaryColor.withOpacity(0.2)),
          elevation: MaterialStateProperty.all(1),
          trailing: [
            InkWell(
              onTap: () {
                // يمكنك هنا تنفيذ البحث الفعلي
                controller.openView();
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.search, color: Colors.white, size: 24),
              ),
            ),
          ],
          onTap: () => controller.openView(),
        );
      },
      suggestionsBuilder: (context, controller) {
        List<String> suggestions = List.generate(5, (index) => 'Item $index');

        if (suggestions.isEmpty) {
          return [
            const ListTile(
              title: Text("No suggestions found"),
            ),
          ];
        }

        return suggestions.map((item) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.search, color: Colors.grey), // أيقونة لكل عنصر
                title: Text(item),
                onTap: () {
                  controller.closeView(item);
                },
              ),
              const Divider(height: 1, color: Colors.grey), // خط فاصل بين العناصر
            ],
          );
        }).toList();
      },
    );
  }
}
