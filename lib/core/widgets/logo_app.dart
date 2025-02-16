import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/TEACH CONNECT LOGO .png',
      width: 300,  
      height: 200,
    );
  }
}
