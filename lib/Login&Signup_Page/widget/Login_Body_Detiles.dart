
import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/widget/forget_passoward.dart';
import 'package:graduation_project/Contact%20Room/chat_view.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/dont_have_account_widget.dart';
import 'package:graduation_project/core/widgets/or_divider.dart';
import 'package:graduation_project/Login&Signup_Page/widget/social_login_button.dart';
import 'package:graduation_project/core/widgets/logo_app.dart';

class LoginBodyDetiles extends StatelessWidget {
  const LoginBodyDetiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          children: [
            LogoApp(),
            // const SizedBox(height: 180),
            CustomTextFormField(
              hintText: 'Email Address',
              textInputType: TextInputType.emailAddress,
              suffixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: const Icon(Icons.remove_red_eye_outlined),
              obscureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPassoward(),
                      ),
                    );
                  },
                  child: Text(
                                  'Forgot Password?',
                    style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            DontHaveAnAccountWidget(),
            const SizedBox(
              height: 24,
            ),
            CustomButton(text: 'Login', onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatView(),
                      ),
                    );
            }),
            const SizedBox(
              height: 21,
            ),
            OrDivider(),
            const SizedBox(
              height: 21,
            ),
            SocialLoginButton(
              onPressed: () {
                // context.read<SigninCubit>().signinWithGoogle();
              },
              image: 'assets/images/google_icon.svg',
              title: 'Register with Google',
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              onPressed: () {
                // context.read<SigninCubit>().signinWithFacebook();
              },
              image: 'assets/images/appl_icon.svg',
              title: 'Register with Apple',
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              onPressed: () {
                // context.read<SigninCubit>().signinWithFacebook();
              },
              image: 'assets/images/facebook_icon.svg',
              title: ' Register with Facebook',
            ),
          ],
        ),
      ),
    );
  }
  }