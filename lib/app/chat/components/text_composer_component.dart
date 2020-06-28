import 'package:flutter/material.dart';

class TextComposerComponent extends StatefulWidget {
  @override
  _TextComposerComponentState createState() => _TextComposerComponentState();
}

class _TextComposerComponentState extends State<TextComposerComponent> {
  bool _isComposing = false;

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
              decoration: InputDecoration(hintText: 'Enviar uma mensagem'),
              onChanged: (text) =>
                  setState(() => _isComposing = text.isNotEmpty),
              onSubmitted: (text) {},
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing ? () {} : null,
          )
        ],
      ),
    );
  }
}
