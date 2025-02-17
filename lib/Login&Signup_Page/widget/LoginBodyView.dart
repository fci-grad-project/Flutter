import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';
import 'package:graduation_project/Login&Signup_Page/widget/Login_Body_Detiles.dart';
import 'package:graduation_project/features/auth/repo/auth_rupo.dart';
import 'package:graduation_project/features/cubits/cubit/signin_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(GetIt.I<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'Login'),
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Success',
                  message: 'Login Success',
                  contentType: ContentType.success, // تحديد نوع النجاح
                ),
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SigninLoading ? true : false,
              child: LoginBodyDetiles(),
            );
          },
        ),
      ),
    );
  }
}
