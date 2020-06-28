import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextComposerComponent extends StatefulWidget {
  Function(String) sendMessage;
  TextComposerComponent({this.sendMessage});

  @override
  _TextComposerComponentState createState() => _TextComposerComponentState();
}

class _TextComposerComponentState extends State<TextComposerComponent> {
  final TextEditingController _controller = TextEditingController();
  bool _isComposing = false;

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enviar uma mensagem'),
              onChanged: (text) =>
                  setState(() => _isComposing = text.isNotEmpty),
              onSubmitted: (text) {
                widget.sendMessage(text);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(_controller.text);
                    _reset();
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
