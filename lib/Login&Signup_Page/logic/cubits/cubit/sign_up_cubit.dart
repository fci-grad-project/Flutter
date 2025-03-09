import 'package:bloc/bloc.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/entity/user_entity.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/repo/auth_rupo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(String email, String password,
      String name, String role) async {
    emit(SignUpLoading());
    final result = await authRepo.CreateUserWithEmailAndPassword(
        email, password, name, role, ''); // Added an empty string as the 5th argument
    result.fold((faliure) => emit(SignUpFailler(message: faliure.message)),
        (UserEntity) => emit(SignUpSuccess(user: UserEntity)));
  }
}
