import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception('An error occurred during user creation.');
    } catch (e) {
      print(e);
      throw Exception('An unexpected error occurred.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw Exception('there is no user record corresponding to this identifier. The user may have been deleted.');
      } else if (e.code == 'wrong-password') {
        throw Exception(' The password is invalid or the user does not have a password.');
      } else if (e.code == 'network-request-failed') {
        throw Exception(' An error occurred while attempting to connect to the server.');
      } else {
        throw Exception('An unexpected error occurred.');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}