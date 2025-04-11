import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:graduation_project/Login&Signup_Page/server/auth/api_service.dart';
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

class LoginBodyDetiles extends StatefulWidget {
  const LoginBodyDetiles({super.key});

  @override
  State<LoginBodyDetiles> createState() => _LoginBodyDetilesState();
}

class _LoginBodyDetilesState extends State<LoginBodyDetiles> {
  String? _email;
  String? _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _submitLogin() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    final res = await ApiService.login(_email!, _password!);

    setState(() => _isLoading = false);

    if (res != null && res.statusCode == 200) {
      final userData = res.data["user"];
      print("Login success: $userData");

      // هنا تحط التنقل للصفحة الرئيسية
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Success',
            message: 'Login successful!',
            contentType: ContentType.success,
          ),
        ),
      );

      Navigator.pushReplacementNamed(context, '/NavBar');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Error',
            message: 'Login failed. Check your credentials.',
            contentType: ContentType.failure,
          ),
        ),
      );
    }
  }

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
                        MaterialPageRoute(builder: (context) => ForgetPassoward()),
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
              DontHaveAnAccountWidget(),
              const SizedBox(height: 24),
              CustomButton(
                text: _isLoading ? 'Logging in...' : 'Login',
                onPressed: _isLoading ? null : _submitLogin,
              ),
              if (_isLoading)
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              const SizedBox(height: 21),
              OrDivider(),
              const SizedBox(height: 21),
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