import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/auth/entity/user_entity.dart';
import 'package:graduation_project/features/auth/entity/user_model.dart';
import 'package:graduation_project/features/auth/repo/auth_rupo.dart';
import 'package:graduation_project/features/error/failler.dart';
import 'package:graduation_project/features/services/firebase_auth_services.dart';

class AuthRepoImple extends AuthRepo {
    final FirebaseAuthServices firebaseAuthServices;
    AuthRepoImple({required this.firebaseAuthServices});
    @override
    Future<Either<Failler, UserEntity>> CreateUserWithEmailAndPassword(
      String email,
      String password,
      String name,
      String role,
      String additionalParam,
    ) async {
      try {
        await firebaseAuthServices.createUserWithEmailAndPassword(
            email, password);
        return Right(UserModel(
            name: name,
            email: email,
            role: role,
            password: password));
      } on Exception catch (e) {
        return Left(ServerFailler(message: e.toString()));
      }
    }
}