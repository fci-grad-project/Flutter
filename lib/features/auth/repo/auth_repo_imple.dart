import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    @override
     Future<Either<Failler, UserEntity>> signInWithEmailAndPassword(
  String email,
  String password,
) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user != null) {
      // إذا كان التسجيل ناجحًا، نمرر بيانات المستخدم إلى `Right`
      return Right(UserModel(
        name: credential.user?.displayName ?? '',
        email: credential.user?.email ?? '',
        role: '',  // ضع هنا دور المستخدم إذا كان موجودًا
        password: password,
      ));
    } else {
      return Left(ServerFailler(message: 'Login failed. Please try again.'));
    }
  } on FirebaseAuthException catch (e) {
    // نعرض رسائل الأخطاء التي يتم استلامها من Firebase
    String errorMessage;
    switch (e.code) {
      case 'user-not-found':
        errorMessage = 'No user found for that email.';
        break;
      case 'wrong-password':
        errorMessage = 'Wrong password provided for that user.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is badly formatted.';
        break;
      case 'network-request-failed':
        errorMessage = 'Please check your internet connection.';
        break;
      default:
        errorMessage = 'An unexpected error occurred.';
    }
    return Left(ServerFailler(message: errorMessage));  // عرض رسالة الخطأ للمستخدم
  } catch (e) {
    return Left(ServerFailler(message: 'An unexpected error occurred.'));
  }
}

    
}