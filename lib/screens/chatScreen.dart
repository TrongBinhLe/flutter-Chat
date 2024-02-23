import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
      ),
      body: Center(
        child: Text('Loggin!'),
      ),
    );
  }
}
