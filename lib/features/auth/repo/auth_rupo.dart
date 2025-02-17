import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/auth/entity/user_entity.dart';
import 'package:graduation_project/features/error/failler.dart';

abstract class AuthRepo {
  Future<Either<Failler, UserEntity>> CreateUserWithEmailAndPassword(
      String email, String password, String name , String role  , String id);
}
