import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10
      ),
      child: Image.asset(
        'assets/images/Teach Connect logo.png',
        width: 330,  
        height: 200,
      ),
    );
  }
}
