import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Nav%20Bar%20Iteam/nav.dart';
import 'package:graduation_project/home%20screen/widgets/Live_EventsPage.dart';

void main() {
  runApp(const TeachConnect());
}

class TeachConnect extends StatelessWidget {
  const TeachConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.cairo().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.cairoTextTheme(), // تطبيق الخط على كل النصوص
      ),
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}
