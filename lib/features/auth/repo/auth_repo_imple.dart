import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/auth/entity/user_entity.dart';
import 'package:graduation_project/features/auth/entity/user_model.dart';
import 'package:graduation_project/features/auth/repo/auth_rupo.dart';
import 'package:graduation_project/features/error/failler.dart';
import 'package:graduation_project/features/services/firebase_auth_services.dart';

class AuthRepoImple extends AuthRepo {
final FirebaseAuthServices firebaseAuthServices;
AuthRepoImple(this.firebaseAuthServices);

@override
Future<Either<Failler, UserEntity>> CreateUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String role,
    String profileImage,
    String id) async {
  try {
    var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email, password);
    return Right(UserModel(
        id: user.uid,
        name: name,
        email: email,
        role: role,
        profileImage: profileImage,
        password: password));
  } on Exception catch (e) {
    return Left(ServerFailler(message: e.toString()));
  }
}
}