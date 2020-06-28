import 'package:chat_flutter/app/chat/components/text_composer_component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void _sendMessage(String text) {
    Firestore.instance.collection('messages').add({'text': text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Page'), centerTitle: true, elevation: 0),
      body: TextComposerComponent(sendMessage: _sendMessage),
    );
  }
}
