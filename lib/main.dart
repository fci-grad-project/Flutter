import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/home/screen/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'cairo',
      ),
      // locale: const Locale('ar'), // اللغة الافتراضية: العربية
      // supportedLocales: const [
      //   Locale('ar'), // اللغة العربية
      //   Locale('en'), // اللغة الإنجليزية
      // ],
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      debugShowCheckedModeBanner: false,
      home: const DetailsScreen(title: 'ahmed',),
    );
  }
}