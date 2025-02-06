import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/view%20cours/screen/details_screen.dart';

void main() {
  runApp(const TeachConnect());
}

class TeachConnect extends StatelessWidget {
  const TeachConnect({super.key});

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
      home:  DetailsScreen(title: '',),
    );
  }
}