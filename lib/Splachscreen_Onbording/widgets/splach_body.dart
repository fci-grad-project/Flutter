import 'package:flutter/material.dart';
import 'package:graduation_project/Splachscreen_Onbording/onbording_view.dart';

class SplachBody extends StatefulWidget {
  const SplachBody({super.key});

  @override
  State<SplachBody> createState() => _SplachBodyState();
}

class _SplachBodyState extends State<SplachBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnbordingView(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Teach Connect logo.png',
          height: 200,
          // width: 100,
        ),
      ),
    );
  }
}
