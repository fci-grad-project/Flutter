import 'package:get_it/get_it.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/repo/auth_repo_imple.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/repo/auth_rupo.dart';
import 'package:graduation_project/Login&Signup_Page/logic/auth/services/firebase_auth_services.dart';

final getIt = GetIt.instance;


void setupGitIT() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImple(
    firebaseAuthServices: getIt<FirebaseAuthServices>(),
  ));

// Alternatively you could write it if you don't like global variables
}