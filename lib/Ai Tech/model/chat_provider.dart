import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/Ai%20Tech/model/message_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatProvider with ChangeNotifier {
  List<Message> _currentMessages = [];
  List<List<Message>> _chatHistory = [];
  String _selectedModel = 'Gemini';

  List<Message> get currentMessages => _currentMessages;
  List<List<Message>> get chatHistory => _chatHistory;
  String get selectedModel => _selectedModel;

  ChatProvider() {
    _loadChatsFromStorage();
  }

  void addMessage(String text, bool isUser, String model) {
    _currentMessages.add(Message(text: text, isUser: isUser, model: model));
    _saveChatsToStorage();
    notifyListeners();
  }

  void startNewChat() {
    if (_currentMessages.isNotEmpty) {
      _chatHistory.add(List.from(_currentMessages));
      _saveChatsToStorage();
    }
    _currentMessages.clear();
    notifyListeners();
  }

  void loadChat(int index) {
    if (index >= 0 && index < _chatHistory.length) {
      _currentMessages = List.from(_chatHistory[index]);
      notifyListeners();
    }
  }

  Future<void> _saveChatsToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedHistory = _chatHistory
        .map((chatList) => jsonEncode(chatList.map((msg) => msg.toJson()).toList()))
        .toList();
    List<String> encodedCurrent = _currentMessages.map((msg) => jsonEncode(msg.toJson())).toList();

    await prefs.setStringList('chatHistory', encodedHistory);
    await prefs.setStringList('currentMessages', encodedCurrent);
  }

  Future<void> _loadChatsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? encodedHistory = prefs.getStringList('chatHistory');
    List<String>? encodedCurrent = prefs.getStringList('currentMessages');

    if (encodedHistory != null) {
      _chatHistory = encodedHistory.map((chatJson) {
        List<dynamic> chatList = jsonDecode(chatJson);
        return chatList.map((item) => Message.fromJson(item)).toList();
      }).toList();
    }

    if (encodedCurrent != null) {
      _currentMessages = encodedCurrent.map((msgJson) {
        return Message.fromJson(jsonDecode(msgJson));
      }).toList();
    }

    notifyListeners();
  }
}
