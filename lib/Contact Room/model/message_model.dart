class Messages {
  final String message;
  final String senderId; // معرف المرسل
  final String receiverId; // معرف المستلم

  Messages({
    required this.message,
    required this.senderId,
    required this.receiverId,
  });

  factory Messages.fromJson(Map<String, dynamic>? jsonData) {
    if (jsonData == null) {
      return Messages(message: '', senderId: '', receiverId: '');
    }
    return Messages(
      message: jsonData['message'] ?? '',
      senderId: jsonData['senderId'] ?? '',
      receiverId: jsonData['receiverId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
    };
  }
}
