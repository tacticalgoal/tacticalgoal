import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});    // Updated

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Center(
        child: Text('Chat Page'),
      ),
    );
  }                 
}