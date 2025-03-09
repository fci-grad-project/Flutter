import 'package:bloc/bloc.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/entity/user_entity.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/repo/auth_rupo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;

  SigninCubit({required this.authRepo}) : super(SigninInitial());

  Future<void> signin(String email, String password) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        // عرض رسالة الخطأ للمستخدم عند الفشل
        emit(SigninFailure(message: failure.message));
      },
      (userEntity) {
        // عند النجاح، نقوم بإصدار حالة النجاح
        emit(SigninSuccess(user: userEntity));
      },
    );
  }
  Future<void> signinWithGoogle() async {
    emit(SigninLoading());

    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        // عرض رسالة الخطاء للمستخدم عند الفشل
        emit(SigninFailure(message: failure.message));
      },
      (userEntity) {
        // عند النجاح، نقوم بإصدار حالة النجاح
        emit(SigninSuccess(user: userEntity));
      },
    );
  }
  Future<void> signinWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        // عرض رسالة الخطاء للمستخدم عند الفشل
        emit(SigninFailure(message: failure.message));
      },
      (userEntity) {
          // عند النجاح، نقوم بإصدار حالة النجاح
        emit(SigninSuccess(user: userEntity));
        },
          );
      }
}
