import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class TextComposerComponent extends StatefulWidget {
  TextComposerComponent({this.sendMessage});

  final Function({String text, File imgFile}) sendMessage;

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
            onPressed: () async {
              final File imgFile =
                  // ignore: deprecated_member_use
                  await ImagePicker.pickImage(source: ImageSource.camera);
              if (imgFile == null) return;
              widget.sendMessage(imgFile: imgFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enviar uma mensagem'),
              onChanged: (text) =>
                  setState(() => _isComposing = text.isNotEmpty),
              onSubmitted: (text) {
                widget.sendMessage(text: text);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(text: _controller.text);
                    _reset();
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
