import 'package:flutter/material.dart';
import 'package:graduation_project/Contact%20Room/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends ChangeNotifier {
  late IO.Socket socket;
  final Map<String, List<Message>> _messages = {}; // ✅ تخزين الرسائل لكل مستخدم
  final List<Message> _pendingMessages = [];
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final String currentUserId = 'user123';

  List<Message> getMessagesForUser(String receiverId) {
    return _messages[receiverId] ?? [];
  }

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
        _sendPendingMessages();
      });

      socket.on('receive_message', (data) {
        final message = Message.fromJson(data);
        _messages.putIfAbsent(message.receiverId!, () => []).add(message);
        notifyListeners();
        _scrollToBottom();
      });

      socket.onDisconnect((_) {
        print('Disconnected from server');
      });

      socket.onError((error) {
        print('Error connecting to server: $error');
      });
    } catch (e) {
      print('Exception: $e');
    }
  }

  void sendMessage({
    required String messageText,
    required String receiverId,
    required String receiverName,
    required String receiverLogo,
  }) {
    if (messageText.isNotEmpty) {
      final newMessage = Message(
        messageId: DateTime.now().millisecondsSinceEpoch,
        messageNumber: "",
        messageLogo: receiverLogo,
        messageName: receiverName,
        messageText: messageText,
        senderId: currentUserId,
        receiverId: receiverId,
      );

      _messages.putIfAbsent(receiverId, () => []).add(newMessage);

      if (socket.connected) {
        socket.emit('send_message', newMessage.toJson());
      } else {
        _pendingMessages.add(newMessage);
      }

      messageController.clear();
      notifyListeners();
      _scrollToBottom();
    }
  }

  void _sendPendingMessages() {
    if (_pendingMessages.isNotEmpty) {
      for (var msg in _pendingMessages) {
        socket.emit('send_message', msg.toJson());
      }
      _pendingMessages.clear();
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
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
