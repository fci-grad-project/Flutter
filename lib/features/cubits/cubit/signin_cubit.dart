import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/auth/entity/user_entity.dart';
import 'package:graduation_project/features/auth/repo/auth_rupo.dart';
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
}
