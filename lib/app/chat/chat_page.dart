import 'package:chat_flutter/app/chat/components/text_composer_component.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Page'), centerTitle: true, elevation: 0),
      body: TextComposerComponent(),
    );
  }
}
