import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NewWidget(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) {
        return SearchBar(
          controller: controller,
          hintText: "Search",
          textStyle: MaterialStateProperty.all(
            const TextStyle(color: Color(0xff0D9276)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xff0D9276), width: 2),
            ),
          ),
          shadowColor: MaterialStateProperty.all(Color(0xff0D9276).withOpacity(0.2)),
          elevation: MaterialStateProperty.all(1),
          trailing: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff0D9276),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff0D9276).withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.search, color: Colors.white, size: 24),
            ),
          ],
          onTap: () => controller.openView(),
        );
      },
      suggestionsBuilder: (context, controller) {
        List<String> suggestions = List.generate(5, (index) => 'Item $index');
    
        return suggestions.map((item) {
          return ListTile(
            title: Text(item),
            onTap: () {
              controller.closeView(item);
            },
          );
        }).toList();
      },
    );
  }
}
