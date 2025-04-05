import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/Login&Signup_Page/widget/custom_text_field.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';

class ForgetPassoward extends StatefulWidget {
  const ForgetPassoward({super.key});

  @override
  State<ForgetPassoward> createState() => _ForgetPassowardState();
}

class _ForgetPassowardState extends State<ForgetPassoward> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _resetPassword() async {
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent!')),
      );

      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'An error occurred')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Forget Password'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/restpasswoed.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Enter your Email and we will send you a link to reset your password',
              style: TextStyle(
                fontFamily: 'SFPro',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF616A6B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: _emailController,
              hintText: 'Email Address',
              textInputType: TextInputType.emailAddress,
              suffixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: _resetPassword,
              text: 'Forget Password',
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
