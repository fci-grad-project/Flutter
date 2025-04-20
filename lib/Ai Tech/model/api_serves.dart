import 'package:google_generative_ai/google_generative_ai.dart';

class ApiService {
  static const String geminiApiKey = 'AIzaSyDyFgxdTzgzn2nVOgF2oZasBKATtVUO0JE';

  final generativeModel = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: geminiApiKey,
  );

  Future<String> sendMessage(String message, String model) async {
    try {
      final content = [Content.text(message)];
      final response = await generativeModel.generateContent(content);
      return response.text ?? 'No response';
    } catch (e) {
      return 'Error: $e';
    }
  }
}