import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_controller.dart';
import 'package:graduation_project/core/utils/route.dart';
import 'package:graduation_project/features/services/git_it_services.dart';
import 'package:provider/provider.dart';

import 'features/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGitIT();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                ChatController()), // ✅ إضافة ChatController كمزود
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
          AppRoutes.navBar, // تحديد الصفحة الافتراضية عند تشغيل التطبيق
      onGenerateRoute: AppRoutes.generateRoute, // تحديد الـ Routes
    );
  }
}
