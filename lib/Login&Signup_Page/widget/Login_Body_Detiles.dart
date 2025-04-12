import 'package:flutter/material.dart';
import 'package:graduation_project/Login&Signup_Page/server/auth/login_control.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/CustomTextFormFieldPassword.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';
import 'package:graduation_project/Login&Signup_Page/widget/dont_have_account_widget.dart';
import 'package:graduation_project/core/widgets/or_divider.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_text_styles.dart';
import 'package:graduation_project/Login&Signup_Page/widget/forget_passoward.dart';
import 'package:graduation_project/core/widgets/logo_app.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Social_media_buttom.dart';

class LoginBodyDetiles extends StatefulWidget {
  const LoginBodyDetiles({super.key});

  @override
  State<LoginBodyDetiles> createState() => _LoginBodyDetilesState();
}

class _LoginBodyDetilesState extends State<LoginBodyDetiles> {
  String? _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const LogoApp(),
              CustomTextFormField(
                onSaved: (value) => _email = value,
                hintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldPassowrd(
                onSaved: (value) => _password = value,
                hintText: 'Password',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgetPassoward()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 24),
              CustomButton(
                text: controller.isLoading ? 'Logging in...' : 'Login',
                onPressed: controller.isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          controller.login(
                            context: context,
                            email: _email!,
                            password: _password!,
                          );
                        }
                      },
              ),
              if (controller.isLoading)
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              const SizedBox(height: 21),
              const OrDivider(),
              const SizedBox(height: 21),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
