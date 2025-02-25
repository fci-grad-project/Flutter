class Message {
  final int messageId;
  final String messageNumber;
  final String messageLogo;
  final String messageName;
  final String? messageText; // محتوى الرسالة (اختياري)
  final String? senderId; // معرف المرسل
  final String? receiverId; // معرف المستقبل

  Message({
    required this.messageId,
    required this.messageNumber,
    required this.messageLogo,
    required this.messageName,
    this.messageText, // يمكن أن تكون الرسالة فارغة عند استعراض جهات الاتصال فقط
    this.senderId,
    this.receiverId,
  });

  // تحويل JSON إلى كائن
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageId'],
      messageNumber: json['messageNumber'],
      messageLogo: json['messageLogo'],
      messageName: json['messageName'],
      messageText: json['messageText'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
    );
  }

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'messageNumber': messageNumber,
      'messageLogo': messageLogo,
      'messageName': messageName,
      'messageText': messageText,
      'senderId': senderId,
      'receiverId': receiverId,
    };
  }
}

// قائمة جهات الاتصال
List<Message> contacts = [
  {
    "messageId": 1,
    "messageNumber": "01151403671",
    "messageLogo": "https://cdn4.iconfinder.com/data/icons/professions-1-2/151/10-1024.png",
    "messageName": "Dr. Safa Mahmoud"
  },
  {
    "messageId": 2,
    "messageNumber": "01151403671",
    "messageLogo": "https://cdn-icons-png.flaticon.com/512/6833/6833590.png",
    "messageName": "Dr. Sara Mongy"
  },
  {
    "messageId": 3,
    "messageNumber": "01151403671",
    "messageLogo": "https://cdn-icons-png.flaticon.com/512/4042/4042422.png",
    "messageName": "Dr Amal"
  },
  {
    "messageId": 4,
    "messageNumber": "01151403671",
    "messageLogo": "https://cdn-icons-png.flaticon.com/512/610/610120.png",
    "messageName": "Dr. Mahmoud Elsharqawy"
  },
  {
    "messageId": 5,
    "messageNumber": "01151403671",
    "messageLogo": "https://cdn-icons-png.flaticon.com/512/4042/4042529.png",
    "messageName": "Dr. Samah Zakaria"
  },
  {
    "messageId": 6,
    "messageNumber": "01151403671",
    "messageLogo": "https://cdn-icons-png.flaticon.com/512/4042/4042522.png",
    "messageName": "Dr. Sara Mongy"
  }
].map((json) => Message.fromJson(json)).toList();
