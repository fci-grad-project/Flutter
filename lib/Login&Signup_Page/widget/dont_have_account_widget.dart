import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/SignUpView.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
// import '../signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp_View(),
                  ),
                );
              },
            text: 'Sign Up',
            style:
                TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}