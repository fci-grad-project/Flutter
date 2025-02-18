import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Nav%20Bar%20Iteam/nav.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Login_Body_Detiles.dart';
import 'package:graduation_project/features/auth/repo/auth_rupo.dart';
import 'package:graduation_project/features/cubits/cubit/signin_cubit.dart';
import 'package:graduation_project/features/services/git_it_services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(authRepo: getIt<AuthRepo>()),
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Login'),
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            _showSnackBar(
                context, 'Success', 'Login Successful', ContentType.success);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBar(),
                    ));
          } else if (state is SigninFailure) {
            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Error',
                message: state.message, // عرض رسالة الفشل
                contentType: ContentType.failure, // تحديد نوع الفشل
              ),
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar); // ✅ إخفاء الـ SnackBar الحالي أولًا
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SigninLoading,
            child: const LoginBodyDetiles(),
          );
        },
      ),
    );
  }

  void _showSnackBar(
      BuildContext context, String title, String message, ContentType type) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
