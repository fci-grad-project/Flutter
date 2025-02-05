import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends ChangeNotifier {
  late IO.Socket socket;
  final List<Messages> _messages = [];
  final List<Messages> _pendingMessages = []; // لتخزين الرسائل غير المرسلة مؤقتًا
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final String currentUserId = 'user123'; // معرف المستخدم الحالي
  List<Messages> get messages => _messages;

  ChatController() {
    _connectToSocket();
  }

  void _connectToSocket() {
  try {
    socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
  'transports': ['websocket'],
  'autoConnect': true,
});


    socket.onConnect((_) {
      print('Connected to Socket.IO server');
    });

    socket.on('receive_message', (data) {
      _messages.add(Messages(
        message: data['message'],
        senderId: data['senderId'],
        receiverId: data['receiverId'],
      ));
      notifyListeners();
      _scrollToBottom();
    });

    socket.onDisconnect((_) {
      print('Disconnected from server');
    });

    socket.onError((error) {
      print('Error connecting to server: $error');
      // التعامل مع الخطأ أو عرض رسالة للمستخدم
    });
  } catch (e) {
    print('Exception: $e');
    // معالجة استثناءات أخرى مثل عدم القدرة على الاتصال
  }
}


  void sendMessage({required String message, required String receiverId, required String senderId}) {
    if (message.isNotEmpty) {
      final data = {
        'message': message,
        'senderId': currentUserId,
        'receiverId': receiverId,
      };

      // إذا كان الخادم متصلًا، أرسل الرسالة مباشرةً
      if (socket.connected) {
        socket.emit('send_message', data);
      } else {
        // إذا لم يكن الخادم متصلًا، خزّن الرسالة في قائمة الرسائل المعلقة
        _pendingMessages.add(Messages(
          message: message,
          senderId: currentUserId,
          receiverId: receiverId,
        ));
      }

      // إضافة الرسالة إلى قائمة الرسائل المحلية
      _messages.add(Messages(
        message: message,
        senderId: currentUserId,
        receiverId: receiverId,
      ));

      messageController.clear();
      notifyListeners();
      _scrollToBottom();
    }
  }

  // إرسال الرسائل المعلقة عند إعادة الاتصال بالخادم
  void _sendPendingMessages() {
    for (var pendingMessage in _pendingMessages) {
      final data = {
        'message': pendingMessage.message,
        'senderId': currentUserId,
        'receiverId': pendingMessage.receiverId,
      };
      socket.emit('send_message', data); // إرسال الرسالة إلى الخادم
    }
    // بعد إرسال جميع الرسائل المعلقة، امسح قائمة الرسائل المعلقة
    _pendingMessages.clear();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    socket.dispose();
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
