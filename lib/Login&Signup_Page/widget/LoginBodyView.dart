import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Login_Body_Detiles.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: buildAppBar(context, title: 'Login' ),
      
      body: LoginBodyDetiles(),
    );
  }
}

