import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/widget/social_login_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          onPressed: () {},
          image: 'assets/images/google_icon.svg',
          title: 'Register with Google',
          color: Colors.red,
        ),
        const SizedBox(height: 16),
        SocialLoginButton(
          onPressed: () {},
          image: 'assets/images/appl_icon.svg',
          title: 'Register with Apple',
          color: Colors.black,
        ),
        const SizedBox(height: 16),
        SocialLoginButton(
          onPressed: () {},
          image: 'assets/images/facebook_icon.svg',
          title: 'Register with Facebook',
          color: Colors.blue,
        ),
      ],
    );
  }
}
