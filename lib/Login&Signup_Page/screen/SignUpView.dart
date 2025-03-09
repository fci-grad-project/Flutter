import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';
import 'package:graduation_project/Login&Signup_Page/widget/SignUp_View_Body.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/repo/auth_rupo.dart';
import 'package:graduation_project/Login&Signup_Page/logic/cubits/cubit/sign_up_cubit.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/services/git_it_services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp_View extends StatelessWidget {
  const SignUp_View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: ' Sign Up'),
        body: SignupBodyBlocConsumer(),
      ),
    );
  }
}

class SignupBodyBlocConsumer extends StatelessWidget {
  const SignupBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Success',
              message: 'Sign Up Success',
              contentType: ContentType.success,  // تحديد نوع النجاح
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is SignUpFailler) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: state.message,  // عرض رسالة الفشل
              contentType: ContentType.failure,  // تحديد نوع الفشل
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignUpLoading ? true : false,
            child: SignUpViewBody());
      },
    );
  }
}
