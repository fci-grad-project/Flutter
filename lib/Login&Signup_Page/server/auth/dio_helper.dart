import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5001/api', // ✅ عدّلها حسب IP السيرفر لو بتجرب على موبايل حقيقي
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  );

  // POST request عادي
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await _dio.post(url, data: data);
  }

  // POST مع صورة (multipart)
  static Future<Response> postDataWithImage({
    required String url,
    required Map<String, dynamic> data,
    required File imageFile,
    required String imageFieldName,
  }) async {
    String fileName = basename(imageFile.path);

    FormData formData = FormData.fromMap({
      ...data,
      imageFieldName: await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });

    return await _dio.post(
      url,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
  }

  // GET
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(url, queryParameters: query);
  }
}
