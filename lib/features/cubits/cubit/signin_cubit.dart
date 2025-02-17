import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/auth/entity/user_entity.dart';
import 'package:graduation_project/features/auth/repo/auth_rupo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
      
    );
    result.fold((failure) => emit(SigninFailure(message: failure.message)),
        (userEntity) => emit(SigninSuccess(user: userEntity)));
  }
}
