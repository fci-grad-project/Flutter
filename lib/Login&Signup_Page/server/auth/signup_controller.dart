import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:graduation_project/Login&Signup_Page/server/auth/api_service.dart';

class SignupController with ChangeNotifier {
  final BuildContext context;
  bool isLoading = false;

  SignupController(this.context);

  Future<void> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String department,
  }) async {
    isLoading = true;
    notifyListeners(); // التحديث الفوري لواجهة المستخدم

    try {
      final response = await ApiService.signup(
        fullName: fullName,
        email: email,
        password: password,
        department: department,
      );

      if (response != null && response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: AwesomeSnackbarContent(
              title: "Success!",
              message: "Account created successfully.",
              contentType: ContentType.success,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        // يمكن إضافة التوجيه إلى صفحة تسجيل الدخول أو الصفحة الرئيسية
      } else {
        // في حالة الخطأ من السيرفر
        final error = response?.data["message"] ?? "Unknown error occurred.";
        print("Server error: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: AwesomeSnackbarContent(
              title: "Failed!",
              message: error,
              contentType: ContentType.failure,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    } catch (e) {
      // التعامل مع الأخطاء في حالة حدوث مشاكل في الاتصال أو في الـ API
      print("Error during signup: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: "Error!",
            message: "An error occurred. Please try again later.",
            contentType: ContentType.failure,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    } finally {
      isLoading = false;
      notifyListeners(); // التحديث الفوري لواجهة المستخدم بعد الانتهاء
    }
  }
}
