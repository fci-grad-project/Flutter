import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Login&Signup_Page/widget/forget_passoward.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';
import 'package:graduation_project/core/widgets/CustomTextFormFieldPassword.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/dont_have_account_widget.dart';
import 'package:graduation_project/core/widgets/or_divider.dart';
import 'package:graduation_project/Login&Signup_Page/widget/social_login_button.dart';
import 'package:graduation_project/core/widgets/logo_app.dart';
import 'package:graduation_project/features/cubits/cubit/signin_cubit.dart';

class LoginBodyDetiles extends StatefulWidget {
  const LoginBodyDetiles({
    super.key,
  });

  @override
  State<LoginBodyDetiles> createState() => _LoginBodyDetilesState();
}

class _LoginBodyDetilesState extends State<LoginBodyDetiles> {
  late String? _email;
  late String? _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              LogoApp(),
              // const SizedBox(height: 180),
              CustomTextFormField(
                onSaved: (value) => _email = value,
                hintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldPassowrd(
                onSaved: (value) => _password = value,
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
                      style: TextStyles.semiBold16
                          .copyWith(color: AppColors.primaryColor),
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
              CustomButton(
                text: 'Login',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<SigninCubit>().signin(_email!, _password!);
                  } else {
                    // Handle validation errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                      ),
                    );
                  }
                },
              ),
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
                color: Colors.red,
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
                color: Colors.black,
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
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
