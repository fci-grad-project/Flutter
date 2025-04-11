import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5001/api', // ✅ Emulator IP
      headers: {'Content-Type': 'application/json'},
    ),
  );

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
}
