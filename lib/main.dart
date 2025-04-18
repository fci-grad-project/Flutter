import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_controller.dart';
import 'package:graduation_project/AddTasksScreen/model/task_provider.dart';
import 'package:graduation_project/Login&Signup_Page/server/auth/login_control.dart';
import 'package:graduation_project/core/utils/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ChatController()), // مزود المحادثات
        ChangeNotifierProvider(
            create: (context) => TasksProvider()), // ✅ إضافة مزود المهام
        ChangeNotifierProvider(
            create: (context) => LoginController()), // مزود الـ Login
        // ChangeNotifierProvider(
        //     create: (context) => SignupController(context)), // ✅ إضافة مزود التسجيل
      ],
      child: const TeachConnect(),
    ),
  );
}

class TeachConnect extends StatelessWidget {
  const TeachConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teach Connect',
      theme: ThemeData(
        fontFamily: GoogleFonts.cairo().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.cairoTextTheme(), // تطبيق الخط على كل النصوص
      ),
      debugShowCheckedModeBanner: false,
      initialRoute:
          AppRoutes.homeScreenAiTech, // تحديد الصفحة الافتراضية عند تشغيل التطبيق
      onGenerateRoute: AppRoutes.generateRoute, // تحديد الـ Routes
    );
  }
}
