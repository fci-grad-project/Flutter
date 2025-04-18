import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5001/api', // Emulator IP
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // ✅ تسجيل الدخول
  static Future<Response?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }
  // ✅ تسجيل الخروج
static Future<Response?> signup({
  required String fullName,
  required String email,
  required String password,
  required String department, // بنعتبره نفس الـ "role" في الواجهة
}) async {
  try {
    final response = await _dio.post(
      '/auth/signup',
      data: {
        "fullName": fullName,
        "email": email,
        "password": password,
        "department": department,
      },
    );
    return response;
  } catch (e) {
    print("Signup Error: $e");
    return null;
  }
}

  }

  