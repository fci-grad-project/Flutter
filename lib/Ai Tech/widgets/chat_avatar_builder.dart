import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_types;

Widget buildAvatar(chat_types.User userData) {
  if (userData.id == 'user') {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/student.png'),
    );
  } else if (userData.id == 'bot') {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/robotlearn.png'),
    );
  } else {
    return const CircleAvatar(child: Icon(Icons.person));
  }
}
