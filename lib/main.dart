import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Login&Signup_Page/LoginView.dart';

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
      home: LoginView(),
    );
  }
}
