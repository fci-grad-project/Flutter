import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/widget/SignUp_View_Body.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';

class SignUp_View extends StatelessWidget {
  const SignUp_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: ' Sign Up'),
      body: SignUpViewBody()
    );
  }
}


