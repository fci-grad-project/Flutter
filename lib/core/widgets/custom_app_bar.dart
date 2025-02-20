import 'package:flutter/material.dart';

AppBar buildAppBar(context,
    {required String title,
    bool showBackButton = true,
    Color? backgroundColor,
    bool showNotification = true}) {
  return AppBar(
    
backgroundColor: backgroundColor ?? Colors.white,    actions: [
      Visibility(
        visible: showNotification,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
        ),
      )
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        // child: const Icon(
        //   Icons.arrow_back_ios_new,
        // ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'SFPro',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
