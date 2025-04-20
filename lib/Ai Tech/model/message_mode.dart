class Message {
  final String text;
  final bool isUser;
  final String model;

  Message({required this.text, required this.isUser, required this.model});

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isUser': isUser,
      'model': model,
    };
  }

  // تحويل JSON إلى كائن
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'] ?? '',
      isUser: json['isUser'] ?? false,
      model: json['model'] ?? '',
    );
  }
}
