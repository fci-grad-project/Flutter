import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project/Login&Signup_Page/server/auth/api_service.dart';

class LoginController with ChangeNotifier {
  bool isLoading = false;

Future<void> login({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  isLoading = true;
  notifyListeners();

  final res = await ApiService.login(email, password);

  isLoading = false;
  notifyListeners();

  if (res != null && res.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    // استلام بيانات المستخدم
    final user = res.data;

    // التحقق من الدور (role) وتوجيه المستخدم للصفحة المناسبة
    if (user['role'] == 'professor') {
      // إذا كان المستخدم أستاذ، قم بتوجيهه إلى صفحة InstructorProfilePage
      Navigator.pushReplacementNamed(context, '/InstractourDashboard');
    } else {
      // إذا كان المستخدم طالب، قم بتوجيهه إلى صفحة NavBar
      Navigator.pushReplacementNamed(context, '/NavBar');
    }

    // ✅ SnackBar للنجاح
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login successful")),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login failed")),
    );
  }
}

}
