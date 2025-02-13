import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfileBody extends StatelessWidget {
  const ViewProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('View Profile', style: TextStyle(fontSize: 20),),
      )
    );
  }
}